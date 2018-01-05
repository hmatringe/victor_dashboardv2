class ScopesController < ApplicationController
  before_action :set_scope, only: [:show, :edit, :update, :destroy]
  def index
    @scopes ||= Scope.all
    
    @tasks = []
    @scopes.each do |sc|
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
    @scope = Scope.new
  end

  def create
    @scope = Scope.new(scope_params)

    respond_to do |format|
      if @scope.save
        format.html { redirect_to @scope, notice: 'scope was successfully created.' }
        # format.json { render :show, status: :created, location: @scope }
      else
        format.html { render :new }
        # format.json { render json: @scope.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @scope.update(scope_params)
        format.html { redirect_to @scope, notice: 'scope was successfully updated.' }
        # format.json { render :show, status: :ok, location: @scope }
      else
        format.html { render :edit }
        # format.json { render json: @scope.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end
  
  private

  def set_scope
    @scope = Scope.find(params[:id])
  end

  def scope_params
    params.require(:scope).permit(:name, :sort_weight, :start_date, :end_date, :status)
  end
end
