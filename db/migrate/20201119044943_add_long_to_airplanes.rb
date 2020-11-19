class AddLongToAirplanes < ActiveRecord::Migration[6.0]
  def change
    add_column :airplanes, :long, :float
  end
end
