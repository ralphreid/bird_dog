class Hunt < ActiveRecord::Base
  attr_accessible :name, :status, :user_id

  belongs_to :user

  has_many :hunt_properties
  has_many :properties, :through => :hunt_properties

  has_many :hunt_streets
  has_many :streets, :through => :hunt_streets
end
