class AddColumnStickyToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :sticky, :boolean, :default => false
  end
end
