class StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :home
  
  def home
  end
  
  def index
    @streams = Stream.all
  end

  def show
  end

  def new
    @stream = Stream.new
  end

  def create
    @stream = Stream.new(stream_params)

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

  def stream_params
    params.require(:stream).permit(:title, :description, :start_date, :end_date_forecast, :end_date_actual, :user_id, :step_id)
  end
end
