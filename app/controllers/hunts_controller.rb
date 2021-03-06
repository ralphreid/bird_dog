class HuntsController < ApplicationController

  before_filter :authenticate_user!

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
    @hunts_streets = hunt_select(:streets)
    
    # @properties = @hunt.properties
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

  def add_street
    hunt = Hunt.find params[:hunt_id]
    params[:ids].each do |street_id|
      @hunt_street= HuntStreet.create({
        hunt_id: params[:hunt_id],
        street_id: street_id
      })
    end

    render nothing: true
  end 

  def add_property
    hunt = Hunt.find params[:hunt_id]
    params[:ids].each do |property_id|
      @hunt_property = HuntProperty.create({
        hunt_id: params[:hunt_id],
        property_id: property_id
      })
    end

    render nothing: true
  end 

  def add_by_url
    @property = Property.find_by_details_url params["url"]
    @hunt = Hunt.find(params[:id])
    if @property
      begin
        @hunt.properties << @property
        flash[:notice] = 'added'
      rescue ActiveRecord::RecordInvalid
        flash[:notice] = "already in hunt"
      end
      redirect_to hunt_path(@hunt)
    else
      handle_new_property_url
    end
  end


private
 
  def handle_new_property_url
    # in future see if url domain is supoorted for scraping
    # for now, just redirect to new property form


    # redirect to form toeh action that loads the properties new form
    new_prop_params = {
      hunt_id: params[:id],
      details_url: params[:url]
    }
    redirect_to new_property_url(new_prop_params)

    # other functions to build could be to test for harvested domain and redirect to importio to tune up a connector
    # other function could be to serve the user a list of domains which need tuning
    
  end


  def hunt_select(which = nil)
    function_name = ["hunt", which.to_s].join("_")
    current_user.hunts.map do |hunt|
      #this will either hunt_properties or hunt_streets
      # think hunt.hunt_properties || hunt.hunt_streets
      hunt.send(function_name) 
    end.flatten.uniq_by{ |obj| obj.hunt_id}
  end
end