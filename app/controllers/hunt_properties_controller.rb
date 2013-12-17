class HuntPropertiesController < ApplicationController
  def new
    @hunts = current_user.hunts
    @properties = Property.all
  end

  
end