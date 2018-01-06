# == Schema Information
#
# Table name: streams
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  start_date        :date
#  end_date_forecast :date
#  end_date_actual   :date
#  user_id           :integer
#  step_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Stream < ApplicationRecord
  # en français: Chantier
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :step
  has_many :updates, dependent: :destroy
  
  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :start_date, presence: true
  validates :end_date_forecast, presence: true
  validate :start_date_anterior_or_equal_to_end_date_actual
  validate :start_date_anterior_or_equal_to_end_date_forecast

  before_save :compute_step_dates

  def completion
		if start_date == Date.today
			0
		else
			completed = Date.today.mjd - start_date.mjd
			if end_date_actual
        total = end_date_forecast.mjd - start_date.mjd
      else
        total = end_date_forecast.mjd - start_date.mjd
      end
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

  def duration
    (end_date_actual || end_date_forecast - start_date).to_i    
  end

  def latest_update_status
    if updates.size != 0
      updates.last.progress_status
    else
      "aucune mise à jour"
    end
  end

   def compute_step_dates
     self.step.start_date = self.start_date
     if end_date_actual
       self.step.end_date = self.end_date_actual
     else
       self.step.end_date = self.end_date_forecast
     end
     self.step.save
  end
end
