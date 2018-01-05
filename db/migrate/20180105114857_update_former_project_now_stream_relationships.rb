class UpdateFormerProjectNowStreamRelationships < ActiveRecord::Migration[5.1]
  def change
  	rename_column(:updates, :project_id, :stream_id)
  end
end