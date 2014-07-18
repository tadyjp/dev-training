class Area < ActiveRecord::Base
  belongs_to :pref
  has_many :restaurants
end
