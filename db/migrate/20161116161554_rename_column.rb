class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :guides, :hourly_price, :daily_price
  end
end
