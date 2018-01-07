class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
    supply_timeline_collection(@projects)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: @project.name + t(:creation_successful) }
        # format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :new }
        # format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: @project.name + t(:update_successful) }
        # format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        # format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

  def supply_timeline_collection(projects)
    @colors = []
    colors_librairy = ['#2A5371', '#A2B9C9' , '#B3C19F', '#56683A', '#F26419']
    @tasks = []
    projects.each_with_index do |project, i|
      resource_color = colors_librairy[i]
      project.steps.each do |step|
        @tasks << {
          Position: project.name,
          Name: step.name,
          tooltip: step.name,
          Start: step.start_date,
          End: step.end_date
        }
        @colors << resource_color
      end
    end    
  end
end
