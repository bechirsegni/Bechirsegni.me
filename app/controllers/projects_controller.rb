class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  layout "admin", except: [:index]

  def index
    @projects = Project.all
    @contact = Contact.new(params[:contact_form])
    @contact.request = request
  end

  def show
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save!
      redirect_to root_path, notice: 'project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to root_path, notice: 'project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: 'project was successfully destroyed.'
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title,:description,:url,:logo)
  end

  def correct_user
    @project = current_user.projects.find_by_id(params[:id])
    redirect_to projects_path, notice: "Not authorized to edit this project" if @project.nil?
  end
end
