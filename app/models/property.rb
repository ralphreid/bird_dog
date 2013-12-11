class Property < ActiveRecord::Base
  attr_accessible :arrange_view_link, :image_listing, :listing_blurb, :property_page, :rent, :rent_frequency, :source, :terms, :type_listing, :property_source_id

  has_many :hunt_properties
  has_many :hunts, :through => :hunt_properties

end
