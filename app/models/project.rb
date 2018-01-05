# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
	has_many :steps, dependent: :destroy

	validates :name, presence: true, uniqueness: :true, length: { minimum: 6 }
end
