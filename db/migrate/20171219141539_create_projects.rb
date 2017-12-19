class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date_forecast
      t.date :end_date_actual
      t.references :user, foreign_key: true
      t.references :scope, foreign_key: true

      t.timestamps
    end
  end
end
