class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :home
  
  def home
  end
  
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'project was successfully created.' }
        # format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        # format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        # format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        # format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date_forecast, :end_date_actual, :user_id, :scope_id)
  end
end
