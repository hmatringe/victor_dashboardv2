class Project < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :scope
  has_many :updates, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :start_date, presence: true
  validates :end_date_forecast, presence: true
  validate :start_date_anterior_or_equal_to_end_date_actual
  validate :start_date_anterior_or_equal_to_end_date_forecast

  def completion
		if start_date == Date.today
			0
		else
			completed = Date.today.mjd - start_date.mjd
			total = [end_date_forecast].max.mjd - start_date.mjd
			(completed.to_f / total * 100).round(0)
		end
  end

  def start_date_anterior_or_equal_to_end_date_actual
    if end_date_actual && end_date_actual < start_date
      errors.add :end_date_actual, "must be anterior or equal to start date"
    end
  end
  
  def start_date_anterior_or_equal_to_end_date_forecast
    if end_date_forecast < start_date
      errors.add :end_date_forecast, "must be anterior or equal to start date"
    end
  end

  def update_this_week?
    updates.where(update_week: @this_week).size != 0
  end
end
