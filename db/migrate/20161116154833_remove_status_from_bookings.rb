class RemoveStatusFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bookings, :status, foreign_key: true
  end
end
