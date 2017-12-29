class Update < ApplicationRecord
	belongs_to :project

	validates :update_week, presence: true, uniqueness: { scope: :project }
	validates :main_progress, presence: true
	validates :progress_status, presence: true, inclusion: {in: ["as_planned", "slight_delays", "delayed"]} 
	# validates :risks, presence: true
	# validates :next_steps, presence: true

	def progress_status_color
		{ "as_planned" => "success",
			"slight_delays" => "warning",
			"delayed" => "danger"
			}[progress_status]
	end
end
