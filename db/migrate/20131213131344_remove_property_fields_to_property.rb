class RemovePropertyFieldsToProperty < ActiveRecord::Migration
  def up
    remove_column :properties, :rent
    remove_column :properties, :rent_frequency
    remove_column :properties, :property_page
    remove_column :properties, :terms
    remove_column :properties, :image_listing
    remove_column :properties, :listing_blurb
    remove_column :properties, :arrange_view_link
    remove_column :properties, :property_source_id
    remove_column :properties, :type_listing
  end

  def down

  end

end






