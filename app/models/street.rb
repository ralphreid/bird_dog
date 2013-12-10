class Street < ActiveRecord::Base
  attr_accessible :name, :postcode

  has_many :hunt_streets
  has_many :hunts, :through => :hunt_streets


end
