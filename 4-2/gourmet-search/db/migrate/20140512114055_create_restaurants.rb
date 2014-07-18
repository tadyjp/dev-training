class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :property
      t.string :alphabet
      t.string :name_kana
      t.integer :pref_id
      t.integer :area_id
      t.string :zip
      t.string :address
      t.text :description
      t.boolean :closed

      t.timestamps
    end

    add_index :restaurants, :pref_id
    add_index :restaurants, :area_id
  end
end
