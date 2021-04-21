class UsersController < ApplicationController
  def index
    blob = User.first.theme_song

    response.headers["Content-Type"] = "audio/x-wav"
    response.headers["Content-Disposition"] = "inline"

    blob.download do |chunk|
      response.stream.write(chunk)
    end
  end
end
