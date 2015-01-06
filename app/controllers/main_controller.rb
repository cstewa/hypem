class MainController < ApplicationController
  def show
    @playlists = Playlist.all
  end
end
