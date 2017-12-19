class UpdatesController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :create, :edit, :update]
  
  def updates_of_the_week
    # @last_week = "Semaine " + Time.now.last_week.strftime('%W') + " du " + Date.today.last_week.beginning_of_week.strftime('%Y-%m-%d') + " au " + Date.today.last_week.end_of_week.strftime('%Y-%m-%d')
    # @this_week = "Semaine " + Time.now.strftime('%W') + " du " + Date.today.beginning_of_week.strftime('%Y-%m-%d') + " au " + Date.today.end_of_week.strftime('%Y-%m-%d')
    # @updates = Update.where(update_week: LAST_WEEK)
    @updates = Update.where(update_week: @last_week)
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
    @update.project = @project
    respond_to do |format|
      if @update.save
        format.html { redirect_to [@project,@update], notice: 'update was successfully created.' }
        # format.json { render :show, status: :created, location: @update }
      else
        format.html { render :new }
        # format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to [@project,@update], notice: 'Update was successfully updated.' }
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

  def set_project
    @project = Project.find(params[:project_id])
  end
  
  def set_update
    @update = Update.find(params[:id])
  end

  def update_params
    params.require(:update).permit(:update_week, :progress_status, :main_progress, :risks, :next_steps, :project_id)
  end
end
