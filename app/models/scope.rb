class Scope < ApplicationRecord
	has_many :participants, dependent: :destroy
	has_many :projects, dependent: :destroy

	validates :name, presence: true
	validates :ranking, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :status, presence: true, inclusion: {in: %w( status1 status2 status3)}
end
