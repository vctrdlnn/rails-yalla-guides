class RemoveParamsFromGuides < ActiveRecord::Migration[5.0]
  def change
    remove_column :guides, :start_address, :string
    remove_column :guides, :end_address, :string
    remove_column :guides, :lat_start, :string
    remove_column :guides, :lon_start, :string
    remove_column :guides, :lat_end, :string
    remove_column :guides, :lon_end, :string
  end
end
