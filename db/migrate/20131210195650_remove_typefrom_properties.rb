class RemoveTypefromProperties < ActiveRecord::Migration
  def up
    add_column :properties, :type_listing, :string
    remove_column :properties, :type
  end

  def down
    remove_column :properties, :type_listing
    add_column :properties, :type, :string
  end
end
