class ScopesController < ApplicationController
  before_action :set_scope, only: [:show, :edit, :update, :destroy]
  def index
    @scopes = Scope.all
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
