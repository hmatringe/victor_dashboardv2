class AddMainProgressToUpdates < ActiveRecord::Migration[5.1]
  def change
    add_column :updates, :main_progress, :text
  end
end
