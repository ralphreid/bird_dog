class HuntStreet < ActiveRecord::Base
  attr_accessible :rating, :status, :street_id, :hunt_id

  belongs_to :hunt
  belongs_to :street

end
