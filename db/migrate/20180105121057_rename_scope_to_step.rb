class RenameScopeToStep < ActiveRecord::Migration[5.1]
  def change
  	rename_table :scopes, :steps
  end
end
