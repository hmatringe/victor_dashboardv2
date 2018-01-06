class ProjectsController < ApplicationController
  def index
    # @path << { location: projects_path, name: "Projets" }
    @projects = Project.all
    supply_timeline_collection(@projects)
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
  
  private

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
    # steps.each do |step|
    #   @tasks << {
    #     Task_ID: "Étape - #{step.name}",
    #     Task_Name: "Étape - #{step.name}",
    #     Resource: step.name,
    #     Start_Date: step.start_date,
    #     End_Date: step.end_date,
    #     Duration: nil,
    #     Percent_Complete: 100,
    #     Dependencies: nil
    #   }
    #   if step.streams
    #     step.streams.each do |p|
    #       @tasks << {
    #         Task_ID: p.title,
    #         Task_Name: p.title,
    #         Resource: step.name,
    #         Start_Date: p.start_date,
    #         End_Date: p.end_date_actual || p.end_date_forecast,
    #         Duration: nil,
    #         Percent_Complete: p.completion,
    #         Dependencies: nil
    #       }   
    #     end
    #   end
    # end
  end
end
