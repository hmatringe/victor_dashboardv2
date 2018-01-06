class StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :edit, :update, :destroy]
  before_action :set_step, only: [:new, :create]
  skip_before_action :authenticate_user!, only: :home
  
  def home
  end
  
  def index
    @streams = Stream.all
  end

  def show
    @path << { location: projects_path, name: @stream.step.project.name }
    @path << { location: step_path(@stream.step), name: @stream.step.name }
    @path << { location: stream_path(@stream), name: @stream.title }
  end

  def new
    @stream = Stream.new
  end

  def create
    @stream = Stream.new(stream_params)
    @stream.step = @step
    @stream
    respond_to do |format|
      if @stream.save
        format.html { redirect_to @stream, notice: 'stream was successfully created.' }
        # format.json { render :show, status: :created, location: @stream }
      else
        format.html { render :new }
        # format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @stream.update(stream_params)
        format.html { redirect_to @stream, notice: 'stream was successfully updated.' }
        # format.json { render :show, status: :ok, location: @stream }
      else
        format.html { render :edit }
        # format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_stream
    @stream = Stream.find(params[:id])
  end

  def set_step
    @step = Step.find(params[:step_id])
  end

  def stream_params
    params.require(:stream).permit(:title, :description, :start_date, :end_date_forecast, :end_date_actual, :user_id, :step_id)
  end
end
