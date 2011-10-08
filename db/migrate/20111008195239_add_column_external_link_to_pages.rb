class AddColumnExternalLinkToPages < ActiveRecord::Migration
  def change
    add_column :pages, :external_link, :string
  end
end
