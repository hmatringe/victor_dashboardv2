# == Schema Information
#
# Table name: scopes
#
#  id          :integer          not null, primary key
#  name        :string
#  start_date  :date
#  end_date    :date
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sort_weight :integer
#

class Scope < ApplicationRecord
	# en français: Projet
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
