# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

statuses_base = [
  {code: "10", title: "Pending payment"},
  {code: "15", title: "Payment confirmed"},
  {code: "20", title: "Pending guide confirmation"},
  {code: "25", title: "Confirmed by guide"},
  {code: "29", title: "Rejected by guide"},
  {code: "39", title: "Cancelled by guest"},
]
statuses_base.each do |status|
  Status.new(status).save
end
