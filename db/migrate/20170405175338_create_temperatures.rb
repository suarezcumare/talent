class CreateTemperatures < ActiveRecord::Migration[5.0]
  def change
    create_table :temperatures do |t|
      t.float :temp_max
      t.float :temp_min
      t.float :temp

      t.timestamps
    end
  end
end
