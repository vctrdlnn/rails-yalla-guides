class BookingMailerPreview < ActionMailer::Preview
  def guide_new_booking
    booking = Booking.first
    BookingMailer.guide_new_booking(booking)
  end
end
