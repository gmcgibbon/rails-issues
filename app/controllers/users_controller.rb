class UsersController < ApplicationController
  def index
    blob = User.first.theme_song

    response.headers["Content-Type"] = blob.content_type
    response.headers["Content-Disposition"] = "inline"

    blob.download do |chunk|
      response.stream.write(chunk)
    end
  end
end
