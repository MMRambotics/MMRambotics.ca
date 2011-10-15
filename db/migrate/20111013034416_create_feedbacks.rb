class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :browser
      t.integer :browser_width
      t.integer :browser_height
      t.string :os
      t.string :email
      t.string :name
      t.boolean :can_contact
      t.string :content
      t.string :person
      t.string :ip

      t.timestamps
    end
  end
end
