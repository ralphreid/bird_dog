class StreetsController < ApplicationController

  def index
    @streets = Street.all
    @hunts = current_user.hunts
  end

  def new
    @street = Street.new
  end

  def create
    @street = Street.new(params[:street])
    if @street.save
      redirect_to @street, notice: 'Street was successfully created!'
    else
      flash.now[:alert] = 'Street was NOT created!'
      render :new
    end
  end

  def show
    @street = Street.find(params[:id])
  end

  def edit
    @street = Street.find(params[:id])
  end

  def update
    @street = Street.find(params[:id])
    if @street.update_attributes(params[:street])
      redirect_to @street, notice: 'Street was successfully updated!'
    else
      render :edit
      flash.now[:alert] = 'Street was NOT updated!'
    end
  end

  def destroy
    @street = Street.find(params[:id])
    @street.destroy
    redirect_to streets_path
  end

end