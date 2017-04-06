class AddCityRefToTemperature < ActiveRecord::Migration[5.0]
  def change
  	add_reference :temperatures, :city, foreign_key: true
  end
end
