class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_weeks

  def set_weeks
    @last_week =  "Semaine " + Time.now.last_week.strftime('%W') + " du " + Date.today.last_week.beginning_of_week.strftime('%Y-%m-%d') + " au " + Date.today.last_week.end_of_week.strftime('%Y-%m-%d')
    @this_week = "Semaine " + Time.now.strftime('%W') + " du " + Date.today.beginning_of_week.strftime('%Y-%m-%d') + " au " + Date.today.end_of_week.strftime('%Y-%m-%d')
    @next_week = "Semaine " + Time.now.next_week.strftime('%W') + " du " + Date.today.next_week.beginning_of_week.strftime('%Y-%m-%d') + " au " + Date.today.next_week.end_of_week.strftime('%Y-%m-%d')
  end

  def dashboard
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
  end
end
