class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @experiences = Experience.all
  end

  def show
  end

  def new
    @experience = current_user.experiences.build
  end

  def edit
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    if @experience.save!
      redirect_to @experience, notice: 'experience was successfully created.'
    else
      render :new
    end
  end

  def update
    if @experience.update(experience_params)
      redirect_to @experience, notice: 'experience was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_url, notice: 'experience was successfully destroyed.'
  end

  private
  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :duration,:company,:url)
  end

  def correct_user
    @experience = current_user.experience.find_by_id(params[:id])
    redirect_to experiences_path, notice: "Not authorized to edit this education" if @experience.nil?
  end
end
