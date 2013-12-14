class AddPropertyListingFieldsToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :listing_id, :integer
    add_column :properties, :status, :string
    add_column :properties, :listing_status, :string
    add_column :properties, :num_recepts, :integer
    add_column :properties, :price, :integer
    add_column :properties, :details_url, :text
    add_column :properties, :image_url, :text
    add_column :properties, :image_caption, :string
    add_column :properties, :thumbnail_url, :text
    
    add_column :properties, :description, :text
    add_column :properties, :short_description, :text
    add_column :properties, :displayable_address, :string
    add_column :properties, :post_town, :string
    add_column :properties, :street_name, :string
    add_column :properties, :county, :string
    add_column :properties, :latitude, :decimal
    add_column :properties, :longitude, :decimal
    add_column :properties, :outcode, :string

    add_column :properties, :property_type, :string
    add_column :properties, :num_floors, :integer
    add_column :properties, :num_bedrooms, :integer
    add_column :properties, :num_bathrooms, :integer
    add_column :properties, :country, :string
    
    add_column :properties, :agent_name, :string
    add_column :properties, :agent_phone, :string
    add_column :properties, :agent_address, :string
    add_column :properties, :agent_logo, :text
    
    add_column :properties, :first_published_date, :datetime
    add_column :properties, :last_published_date, :datetime

  end
end
