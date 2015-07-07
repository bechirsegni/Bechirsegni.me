class TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  layout "admin", except: [:index]

  def index
    @technologies = Technology.all
  end

  def show
  end

  def new
    @technology = current_user.technologies.build
  end

  def edit
  end

  def create
    @technology = current_user.technologies.build(technology_params)
    if @technology.save!
      redirect_to root_path, notice: 'technology was successfully created.'
    else
      render :new
    end
  end

  def update
    if @technology.update(technology_params)
      redirect_to root_path, notice: 'technology was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @technology.destroy
    redirect_to root_path, notice: 'technology was successfully destroyed.'
  end

  private
  def set_technology
    @technology = Technology.find(params[:id])
  end

  def technology_params
    params.require(:technology).permit(:skill)
  end

  def correct_user
    @technology = current_user.technologies.find_by_id(params[:id])
    redirect_to technologies_path, notice: "Not authorized to edit this education" if @technology.nil?
  end
end
