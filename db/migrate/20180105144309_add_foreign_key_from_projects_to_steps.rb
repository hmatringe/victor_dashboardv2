class AddForeignKeyFromProjectsToSteps < ActiveRecord::Migration[5.1]
  def change
  	add_column :steps, :project_id, :integer
  	add_foreign_key :steps, :projects
  end
end
