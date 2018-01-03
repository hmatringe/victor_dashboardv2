# == Schema Information
#
# Table name: updates
#
#  id              :integer          not null, primary key
#  update_week     :string
#  progress_status :string
#  risks           :text
#  next_steps      :text
#  project_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  main_progress   :text
#

require 'test_helper'

class UpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
