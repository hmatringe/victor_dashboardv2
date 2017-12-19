class Update < ApplicationRecord
	belongs_to :project

	validates :update_week, presence: true, uniqueness: true
	validates :progress_status, presence: true, inclusion: {in: ["non débuté", "en cours", "terminé"]} 
	validates :risks, presence: true
	validates :next_steps, presence: true
end
