class PlaylistsController < ApplicationController
  def popular
    #remember this paginates!
    @playlists = Hypem::Playlist.popular
    render json: { name: "Popular" }
  end

  def latest
  end
end
