class PropertiesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @properties = Property.all
    @hunts = current_user.hunts
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(params[:property])
    if @property.save
      redirect_to @property, notice: 'Property was successfully created!'
    else
      flash.now[:alert] = 'Property was NOT created!'
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
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



end