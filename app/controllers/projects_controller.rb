class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:error] = "Project could not be saved."
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def delete
    # TBD
  end

private

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end

end
