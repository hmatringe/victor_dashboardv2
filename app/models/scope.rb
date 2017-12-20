class Scope < ApplicationRecord
	has_many :participants, dependent: :destroy
	has_many :projects, dependent: :destroy

	validates :name, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :status, presence: true, inclusion: {in: %w( status1 status2 status3)}
  validate :start_date_anterior_or_equal_to_end_date
	

	def start_date_anterior_or_equal_to_end_date
    if end_date < start_date
      errors.add :end_date, "must be anterior or equal to start date"
    end
  end
end
