class HuntStreetsController < ApplicationController
  def new
    @hunts = Hunt.all
    # @hunts = current_user.hunts
    @streets = Street.all
  end

  def create
    params[:ids].each do |street_id|
      @hunt_street = HuntStreet.create({
        hunt_id: params[:hunt_id],
        street_id: street_id
      })

    render nothing: true
    end
  end
end