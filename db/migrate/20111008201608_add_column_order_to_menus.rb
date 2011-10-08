class AddColumnOrderToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :priority, :integer, :default => 1
  end
end
