class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  def index
    @path << { location: steps_path, name: "Étapes" }

    @steps ||= Step.all
    
    supply_gantt_chart_collection(@steps)
  end

  def show
    @path << { location: projects_path, name: @step.project.name }
    @path << { location: step_path(@step), name: @step.name }
    
    supply_gantt_chart_member(@step)
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.start_date = Date.today
    @step.end_date = Date.today + 30

    respond_to do |format|
      if @step.save
        format.html { redirect_to projects_path, notice: 'step was successfully created.' }
        # format.json { render :show, status: :created, location: @step }
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
      if @step.update(step_params)
        format.html { redirect_to projects_path, notice: 'step was successfully updated.' }
        # format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        # format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end
  
  private

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :sort_weight, :start_date, :end_date, :status, :project_id)
  end

  def supply_gantt_chart_collection(steps)
    @tasks = []
    steps.each do |step|
      @tasks << {
        Task_ID: "Étape - #{step.name}",
        Task_Name: "Étape - #{step.name}",
        Resource: step.name,
        Start_Date: step.start_date,
        End_Date: step.end_date,
        Duration: nil,
        Percent_Complete: 100,
        Dependencies: nil
      }
      if step.streams
        step.streams.each do |p|
          @tasks << {
            Task_ID: p.title,
            Task_Name: p.title,
            Resource: step.name,
            Start_Date: p.start_date,
            End_Date: p.end_date_actual || p.end_date_forecast,
            Duration: nil,
            Percent_Complete: p.completion,
            Dependencies: nil
          }   
        end
      end
    end
  end

  def supply_gantt_chart_member(step)    
    @tasks = [{
      Task_ID: "Étape - #{step.name}",
      Task_Name: "Étape - #{step.name}",
      Resource: step.name,
      Start_Date: step.start_date,
      End_Date: step.end_date,
      Duration: nil,
      Percent_Complete: 100,
      Dependencies: nil
    }]
    if step.streams
      step.streams.each do |p|
        @tasks << {
          Task_ID: p.title,
          Task_Name: p.title,
          Resource: step.name,
          Start_Date: p.start_date,
          End_Date: p.end_date_actual || p.end_date_forecast,
          Duration: nil,
          Percent_Complete: p.completion,
          Dependencies: nil
        }   
      end
    end
  end
end
