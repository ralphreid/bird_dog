class Street < ActiveRecord::Base
  attr_accessible :name, :postcode, :image_capture

  has_many :hunt_streets
  has_many :hunts, :through => :hunt_streets

  mount_uploader :image_capture, ImageUploader


end
