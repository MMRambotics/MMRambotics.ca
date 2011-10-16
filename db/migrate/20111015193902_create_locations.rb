class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :place
      t.float :latitude
      t.float :longitude
      t.string :read_more
      t.string :description
      t.integer :album_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
