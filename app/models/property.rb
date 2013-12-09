class Property < ActiveRecord::Base
  attr_accessible :arrange_view_link, :image_listing, :listing_blurb, :property_page, :rent, :rent_frequency, :source, :terms, :type, :property_source_id
end
