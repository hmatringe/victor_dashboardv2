class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  def index
    @steps ||= Step.all
    
    @tasks = []
    @steps.each do |sc|
      @tasks << {
        Task_ID: "Projet - #{sc.name}",
        Task_Name: "Projet - #{sc.name}",
        Resource: sc.name,
        Start_Date: sc.start_date,
        End_Date: sc.end_date,
        Duration: nil,
        Percent_Complete: sc.completion,
        Dependencies: nil
      }
      if sc.streams
        sc.streams.each do |p|
          @tasks << {
            Task_ID: p.title,
            Task_Name: p.title,
            Resource: sc.name,
            Start_Date: p.start_date,
            End_Date: p.end_date_actual || p.end_date_forecast,
            Duration: nil,
            Percent_Complete: p.completion,
            # Dependencies: sc.name
            Dependencies: nil
          }   
        end
      end
    end

  end

  def show
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to @step, notice: 'step was successfully created.' }
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
        format.html { redirect_to @step, notice: 'step was successfully updated.' }
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
    params.require(:step).permit(:name, :sort_weight, :start_date, :end_date, :status)
  end
end
