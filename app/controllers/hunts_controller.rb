class HuntsController < ApplicationController

  def index
    @hunts = current_user.hunts
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

end