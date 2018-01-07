class UpdatesController < ApplicationController
  before_action :set_stream, only: [:new, :create, :edit, :update]
  before_action :set_update, only: [:show, :destroy,:edit, :update]
  
  def updates_of_the_week
    @updates = Update.where(update_week: @this_week)
    @streams_without_updates = Stream.all.reject { |p| p.updates.where(update_week: @this_week).size != 0 }.sort_by {|p| [p.step.name, p.title]}
  end
  
  def updates_of_last_week
    @updates = Update.where(update_week: @last_week)
    @streams_without_updates = Stream.all.reject { |p| p.updates.where(update_week: @last_week).size != 0 }.sort_by {|p| [p.step.name, p.title]}
  end

  def index
    @updates = Update.all
  end

  def show
  end

  def new
    @update = Update.new

  end

  def create
    @update = Update.new(update_params)
    @update.stream = @stream
    respond_to do |format|
      if @update.save
        # format.html { redirect_to controller: "streams", action: "show", notice: 'update was successfully created.' }
        format.html { redirect_to stream_path(@stream), notice: t(:Update) + t(:creation_successful) }

        # format.json { render :show, status: :created, location: @update }
      else
        format.html { render :new }
        # raise
        # format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @update.update(update_params)

        # format.html { redirect_to [@stream,@update], notice: 'Update was successfully updated.' }
        format.html { redirect_to stream_path(@stream), notice: t(:Update) + t(:update_successful) }
        # format.json { render :show, status: :ok, location: @update }
      else
        format.html { render :edit }
        # format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_stream
    @stream = Stream.find(params[:stream_id])
  end
  
  def set_update
    @update = Update.find(params[:id])
  end

  def update_params
    params.require(:update).permit(:update_week, :progress_status, :main_progress, :risks, :next_steps, :stream_id)
  end
end
