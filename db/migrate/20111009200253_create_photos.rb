class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.integer :album_id
      t.boolean :slideshow
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.string :thumbnail_file_name
      t.string :thumbnail_content_type
      t.string :thumbnail_file_size

      t.timestamps
    end
  end
end
