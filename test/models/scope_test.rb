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

require 'test_helper'

class ScopeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
