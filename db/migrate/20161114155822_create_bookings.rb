class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_price
      t.references :guide, foreign_key: true
      t.references :profile, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
