class PropertiesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @properties = Property.where(status: :for_sale)
    @hunts = current_user.hunts
  end

  def new
    @hunt_id = params[:hunt_id]
    @property = Property.new(details_url: params[:details_url])
  end

  def create
    @property = Property.new(params[:property])
    if @property.save
      if params[:hunt_id]
        begin
          @hunt = Hunt.find params[:hunt_id]
          @hunt.properties << @property
          flash[:notice] = 'added'
        rescue ActiveRecord::RecordInvalid
          flash[:notice] = "already in hunt"
        end
        redirect_to hunt_path(@hunt)
      else
        redirect_to @property, notice: 'Property was successfully created!'
      end
    else
      flash.now[:alert] = 'Property was NOT created!'
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])

    # FEATURE TO ADD - should be filtered for suitible comparables using a relation algorithm
    beds = @property.num_bedrooms
    @properties_rent = Property.where(status: :to_rent, num_bedrooms: beds)
    @properties_sale = Property.where(status: :for_sale, num_bedrooms: beds)
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(params[:property])
      redirect_to @property, notice: 'Property was successfully updated!'
    else
      render :edit
      flash.now[:alert] = 'Property was NOT updated!'
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end

  def add_comparable
    property = Property.find params[:property_id]
    params[:ids].each do |comparable_id|
      comparable = Property.find(comparable_id)
      property.properties << comparable
    end
    property.save
    render json: {success: 'successfully added comparable'}
  end

end