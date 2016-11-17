class AddAmountPaidToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :amount_paid, :integer
  end
end
