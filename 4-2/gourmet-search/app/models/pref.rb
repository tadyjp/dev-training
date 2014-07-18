class Pref < ActiveRecord::Base
  has_many :areas
  has_many :restaurants
end
