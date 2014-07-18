require 'net/http'
require 'uri'
require 'pp'

class Restaurant < ActiveRecord::Base
  belongs_to :area
  belongs_to :pref


  class << self

    # レストランデータをSolrへPOSTしindexさせる
    def index_documents
      find_in_batches(batch_size: 1000) do |restaurants|
        hash = restaurants.map do |restaurant|
          {
            id: restaurant.id,
            name: restaurant.name,
            property: restaurant.property,
            alphabet: restaurant.alphabet,
            description: restaurant.description,
            pref: restaurant.pref.try(:name)
          }
        end

        post_to_solr(hash)
      end
    end

    # Solr検索
    # @return [Hash] {restaurants: <Restaurantオブジェクトのリスト>, pref_facets: <ファセット検索結果>}
    #   :pref_facets=>{"東京都"=>994, "北海道"=>267,  ...}
    def search(query, options)
      json = HTTPClient.new.get_content('http://localhost:8983/solr/gourmet/select', {
        q: query,
        wt: 'json',
        'facet' => 'true',
        'facet.field' => 'pref',
      })
      data = JSON.parse(json)
      ids = data['response']['docs'].map { |d| d['id'] }

      {
        restaurants: find(ids),

        # :pref_facets=>{"東京都"=>994, "北海道"=>267,  ...}
        pref_facets: Hash.new.tap { |hash|
          data['facet_counts']['facet_fields']['pref'].in_groups_of(2) { |group|
            hash[group[0]] = group[1]
          }
        }
      }
    end

    private

    # SolrへPOSTするリクエスト
    def post_to_solr(content)
      HTTPClient.new.post_content('http://localhost:8983/solr/gourmet/update/json?commit=true',
                                  content.to_json,
                                  'Content-Type' => 'application/json')
    end
  end

end
