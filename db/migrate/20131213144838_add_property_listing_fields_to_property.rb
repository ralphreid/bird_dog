class AddPropertyListingFieldsToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :floor_plan, :text
  end
end
