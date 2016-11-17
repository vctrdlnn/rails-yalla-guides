class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.guide_new_booking.subject
  #
  def guide_new_booking(booking)
    @greeting = "Hi you have a new booking"
    @guide = booking.guide.profile.user
    mail to: @guide.email, subject: "Hi #{@guide.first_name}, you have a new reservation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.user_booking_confirmed.subject
  #
  def user_booking_confirmed(booking)
    @greeting = "Hi"
    @user = booking.profile.user
    mail to: @user.email, subject: "Hi #{@user.first_name}, your booking is confirmed!"
  end

  def user_booking_cancelled(booking)
    @greeting = "Hi"
    @user = booking.profile.user

    mail to: @user.email, subject: "CAUTION! Your guide cancelled the booking"
  end
end
