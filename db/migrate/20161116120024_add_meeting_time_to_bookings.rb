class AddMeetingTimeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :meeting_time, :time
  end
end
