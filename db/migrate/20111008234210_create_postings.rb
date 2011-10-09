class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :category
      t.string :read_more_url
      t.text :content
      t.datetime :custom_date

      t.timestamps
    end
  end
end
