class AddCoordinatesToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :latitude, :float
    add_column :guides, :longitude, :float
  end
end
