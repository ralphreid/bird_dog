class HuntPropertiesController < ApplicationController
  def new
    @hunts = Hunt.all
    # @hunts = current_user.hunts
    @properties = Property.all
  end

  def create
    params[:ids].each do |property_id|
      @hunt_property = HuntProperty.create({
        hunt_id: params[:hunt_id],
        property_id: property_id
      })
    end

    render nothing: true
  end
end