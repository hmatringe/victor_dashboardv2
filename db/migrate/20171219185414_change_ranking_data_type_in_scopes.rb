class ChangeRankingDataTypeInScopes < ActiveRecord::Migration[5.1]
  def change
  	remove_column :scopes, :ranking
  	add_column :scopes, :ranking, :integer
  end
end
