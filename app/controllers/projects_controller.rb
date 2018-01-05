class ProjectsController < ApplicationController
  def index
    # @path << { location: projects_path, name: "Projets" }
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
  end

  def edit
  end

  def update
  end
end
