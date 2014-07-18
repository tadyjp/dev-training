require 'csv'

namespace :import do

  desc 'import restaurants'
  task restaurants: :environment do
    table = CSV.table(Rails.root.join('tmp', 'ldgourmet', 'restaurants.csv'))
    table.each do |row|
      Restaurant.find_or_create_by(id: row[:id]) do |restaurant|
        restaurant.name = row[:name]
        restaurant.property = row[:property]
        restaurant.alphabet = row[:alphabet]
        restaurant.name_kana = row[:name_kana]
        restaurant.pref_id = row[:pref_id].to_i if row[:pref_id].present?
        restaurant.area_id = row[:area_id].to_i if row[:area_id].present?
        restaurant.zip = row[:zip]
        restaurant.address = row[:address]
        restaurant.description = row[:description]
        restaurant.closed = (row[:closed] == '1')
      end
    end
  end

  desc 'import prefs'
  task prefs: :environment do
    table = CSV.table(Rails.root.join('tmp', 'ldgourmet', 'prefs.csv'))
    table.each do |row|
      Pref.find_or_create_by(id: row[:id]) do |pref|
        pref.name = row[:name]
      end
    end
  end

  desc 'import areas'
  task areas: :environment do
    table = CSV.table(Rails.root.join('tmp', 'ldgourmet', 'areas.csv'))
    table.each do |row|
      Area.find_or_create_by(id: row[:id]) do |area|
        area.name = row[:name]
        area.pref_id = row[:pref_id]
      end
    end
  end

end
