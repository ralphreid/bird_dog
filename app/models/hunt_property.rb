class HuntProperty < ActiveRecord::Base
  attr_accessible :property_id, :rating, :status, :hunt_id

  belongs_to :hunt
  belongs_to :property

end
