class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.string :update_week
      t.string :progress_status
      t.text :risks
      t.text :next_steps
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
