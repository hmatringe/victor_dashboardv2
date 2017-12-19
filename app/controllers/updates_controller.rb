class UpdatesController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :create, :edit, :update, :show]
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
    params.require(:update).permit(:update_week, :progress_status, :risks, :next_steps, :project_id)
  end
end
