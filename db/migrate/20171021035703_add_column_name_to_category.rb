class AddColumnNameToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :title, :string
    remove_column :categories, :name
  end
end
