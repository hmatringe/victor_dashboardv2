# == Schema Information
#
# Table name: updates
#
#  id              :integer          not null, primary key
#  update_week     :string
#  progress_status :string
#  risks           :text
#  next_steps      :text
#  stream_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  main_progress   :text
#

class Update < ApplicationRecord
	belongs_to :stream

	validates :update_week, presence: true, uniqueness: { scope: :stream }
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
