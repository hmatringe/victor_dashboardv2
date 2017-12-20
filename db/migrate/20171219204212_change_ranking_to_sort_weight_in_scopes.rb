class ChangeRankingToSortWeightInScopes < ActiveRecord::Migration[5.1]
  def change
  	remove_column :scopes, :ranking
  	add_column :scopes, :sort_weight, :integer
  end
end
