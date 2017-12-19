class CreateScopes < ActiveRecord::Migration[5.1]
  def change
    create_table :scopes do |t|
      t.string :name
      t.string :ranking
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
