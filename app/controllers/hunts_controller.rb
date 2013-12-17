class HuntsController < ApplicationController

  def index
    @hunts = current_user.hunts
    @hunts_properties = hunt_select(:properties)
    @hunts_streets = hunt_select(:streets)
  end

  def new
    @hunt = Hunt.new
  end

  def create
    @hunt = current_user.hunts.new(params[:hunt])
    if @hunt.save
      redirect_to hunts_path, notice: 'Hunt was successfully created!'
    else
      flash.now[:alert] = 'Hunt was NOT created!'
      render :new
    end
  end

  def show
    @hunt = Hunt.find(params[:id])
  end

  def edit
    @hunt = Hunt.find(params[:id])
  end

  def update
    @hunt = Hunt.find(params[:id])
    if @hunt.update_attributes(params[:hunt])
      redirect_to @hunt, notice: 'Hunt was successfully updated!'
    else
      render :edit
      flash.now[:alert] = 'Hunt was NOT updated!'
    end
  end

  def destroy
    @hunt = Hunt.find(params[:id])
    @hunt.destroy
    redirect_to hunts_path
  end

  def add
    @hunt = Hunt.find(params[:id])
    @hunt.properties << params[:property_id]
  end

  def add_by_url
    @property = Property.find_by_details_url params["url"]
    if @property

    else

    end
  end


private
  def hunt_select(which = nil)
    function_name = ["hunt", which.to_s].join("_")
    current_user.hunts.map do |hunt|
      #this will either hunt_properties or hunt_streets
      # think hunt.hunt_properties || hunt.hunt_streets
      hunt.send(function_name) 
    end.flatten.uniq_by{ |obj| obj.hunt_id}
  end
end