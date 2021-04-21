# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  u = User.create!
  u.photos.attach(io: Rails.root.join('test/fixtures/files/giphy.gif'), filename: '1.gif')
  u.photos.attach(io: Rails.root.join('test/fixtures/files/giphy.gif'), filename: '2.gif')
  u.photos.attach(io: Rails.root.join('test/fixtures/files/giphy.gif'), filename: '3.gif')
end
