class AddPropertyPropertySourceIdToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :property_source_id, :integer
  end
end
