class HuntStreetsController < ApplicationController
  def new
    @hunts = Hunt.all
    # @user = current_user.streets
    @streets = Street.all
  end

  def create
    params[:ids].each do |street_id|
      @hunt_street = StreetProperty.create({
        hunt_id: params[:hunt_id],
        street_id: street_id
      })
    end
  end
end