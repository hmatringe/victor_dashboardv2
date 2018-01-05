class UpdateFormerScopeNowStepRelationships < ActiveRecord::Migration[5.1]
  def change
  	rename_column(:participants, :scope_id, :step_id)
  	rename_column(:streams, :scope_id, :step_id)
  end
end
