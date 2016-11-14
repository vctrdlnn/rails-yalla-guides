class CreateGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :guides do |t|
      t.string :title
      t.text :description
      t.references :profile, foreign_key: true
      t.string :start_address
      t.string :end_address
      t.float :lat_start
      t.float :lon_start
      t.float :lat_end
      t.float :lon_end
      t.string :city
      t.string :photo
      t.integer :hourly_price
      t.string :type

      t.timestamps
    end
  end
end
