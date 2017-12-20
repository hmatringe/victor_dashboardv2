class Update < ApplicationRecord
	belongs_to :project

	validates :update_week, presence: true, uniqueness: { scope: :project }
	validates :progress_status, presence: true, inclusion: {in: %w(green yellow red)} 
	validates :risks, presence: true
	validates :next_steps, presence: true

	def progress_status_color
		stuff = { "green" => "success",
			"yellow" => "warning",
			"red" => "danger"
			}[progress_status]
	end
end
