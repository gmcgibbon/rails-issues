class UsersController < ApplicationController
  def index
    ActiveRecord::Base.transaction do
      u = User.create!
      u.photos.attach(io: Rails.root.join('test/fixtures/files/giphy.gif'), filename: '1.gif')
      u.photos.attach(io: Rails.root.join('test/fixtures/files/giphy.gif'), filename: '2.gif')
      u.photos.attach(io: Rails.root.join('test/fixtures/files/giphy.gif'), filename: '3.gif')
    end
  end
end
