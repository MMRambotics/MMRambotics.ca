class CreateLocationData < ActiveRecord::Migration
  def change
    create_table :location_data do |t|
      t.integer :album_id
      t.integer :photo_id
      t.integer :location_id

      t.timestamps
    end
  end
end
