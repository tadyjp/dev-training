class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :pref_id
      t.string :name

      t.timestamps
    end

    add_index :areas, :pref_id
  end
end
