class Property < ActiveRecord::Base
  attr_accessible :source, :image_caption, :status, :num_floors, :listing_status, :num_bedrooms, :agent_name, :latitude, :agent_address, :num_recepts, :property_type, :country, :longitude, :first_published_date, :displayable_address, :street_name, :num_bathrooms, :thumbnail_url, :description, :post_town, :details_url, :agent_logo, :short_description, :agent_phone, :outcode, :image_url, :last_published_date, :county, :price, :listing_id

  has_many :hunt_properties
  has_many :hunts, :through => :hunt_properties

  has_paper_trail #:only => [:price]


end


