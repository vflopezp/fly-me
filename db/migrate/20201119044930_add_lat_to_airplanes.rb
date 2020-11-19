class AddLatToAirplanes < ActiveRecord::Migration[6.0]
  def change
    add_column :airplanes, :lat, :float
  end
end
