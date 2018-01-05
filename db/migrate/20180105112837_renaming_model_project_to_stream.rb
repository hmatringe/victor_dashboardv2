class RenamingModelProjectToStream < ActiveRecord::Migration[5.1]
  def change
  	rename_table :projects, :streams
  end
end
