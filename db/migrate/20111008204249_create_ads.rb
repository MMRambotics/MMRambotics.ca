class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :format
      t.string :image
      t.string :external_url
      t.string :title
      t.integer :priority, :default => 0
      t.boolean :active

      t.timestamps
    end
  end
end
