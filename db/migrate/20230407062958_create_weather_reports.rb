class CreateWeatherReports < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_reports do |t|
      t.float :temperature
      t.text :description
      t.float :humidity
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
