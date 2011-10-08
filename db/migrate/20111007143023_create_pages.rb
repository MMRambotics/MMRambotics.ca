class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.boolean :is_index, :default => false

      t.timestamps
    end
  end
end
