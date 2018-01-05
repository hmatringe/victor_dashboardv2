class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_weeks, :set_path

  def set_weeks
    # @date_format_db = '%Y-%m-%d'
    @date_format = '%d-%m-%Y'
    @last_week =  "Semaine " + Time.now.last_week.strftime('%W') + " du " + Date.today.last_week.beginning_of_week.strftime(@date_format) + " au " + Date.today.last_week.end_of_week.strftime(@date_format)
    @this_week = "Semaine " + Time.now.strftime('%W') + " du " + Date.today.beginning_of_week.strftime(@date_format) + " au " + Date.today.end_of_week.strftime(@date_format)
    @this_week_short = "Semaine " + Time.now.strftime('%W')
    @next_week = "Semaine " + Time.now.next_week.strftime('%W') + " du " + Date.today.next_week.beginning_of_week.strftime(@date_format) + " au " + Date.today.next_week.end_of_week.strftime(@date_format)
  end

  def dashboard
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
  end

  def after_sign_in_path_for(resource)
    # current_user_path # default
    streams_path
  end

  def set_path
    @path = []
  end
end
