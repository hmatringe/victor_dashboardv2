# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  name        :string
#  start_date  :date
#  end_date    :date
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sort_weight :integer
#  project_id  :integer
#

class Step < ApplicationRecord
	# en français: Étape
	has_many :participants, dependent: :destroy
	has_many :streams, dependent: :destroy
	belongs_to :project

	validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
	# validates :start_date, presence: true
	# validates :end_date, presence: true
	# validates :status, presence: true, inclusion: {in: %w( status1 status2 status3)}
  # validate :start_date_anterior_or_equal_to_end_date

	
 	#  change for proportion of streams that are validated
 	#  stream validation??
  def completion
		if start_date == Date.today
			0
		else
			completed = Date.today.mjd - start_date.mjd
			total = end_date.mjd - start_date.mjd
			(completed.to_f / total * 100).round(0)
		end
  end

	# def start_date_anterior_or_equal_to_end_date
 #    if start_date
	#     if end_date < start_date
	#       errors.add :end_date, "must be anterior or equal to start date"
	#     end
 #    end
 #  end
end
