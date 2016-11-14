class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to '/projects/new'
    else
      render :action => "new"
    end
  end

  def new
    @project = Project.new
    @projects = Project.all
  end

  def index
    @projects = Project.all
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end

  def update

  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :desc)
  end
end