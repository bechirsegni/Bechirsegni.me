class EducationsController < ApplicationController
    before_action :set_education, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!, except: [:index, :show]
    before_filter :correct_user, only: [:edit, :update, :destroy]

    def index
      @educations = Education.all
    end

    def show
    end

    def new
      @education = current_user.educations.build
    end

    def edit
    end

    def create
      @education = current_user.educations.build(education_params)
      if @education.save!
        redirect_to @education, notice: 'Education was successfully created.'
      else
        render :new
      end
    end

    def update
      if @education.update(education_params)
        redirect_to @education, notice: 'Education was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @education.destroy
      redirect_to educations_url, notice: 'Education was successfully destroyed.'
    end

    private
    def set_education
      @education = Education.find(params[:id])
    end

    def education_params
      params.require(:education).permit(:title, :description, :duration,:university,:url)
    end

    def correct_user
      @education = current_user.educations.find_by_id(params[:id])
      redirect_to educations_path, notice: "Not authorized to edit this education" if @education.nil?
    end
end
