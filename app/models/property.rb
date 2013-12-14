class Property < ActiveRecord::Base
  attr_accessible :source, :floor_plan

  serialize :floor_plan

  has_many :hunt_properties
  has_many :hunts, :through => :hunt_properties



end
