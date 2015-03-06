class PlaylistsController < ApplicationController
  def popular
    #remember this paginates!
    tracks = Hypem::Playlist.popular.tracks
    first_page = build_tracks_object(tracks)

    # tracks = Hypem::Playlist.popular.page(2).tracks
    # second_page = build_tracks_object(tracks)

    # tracks = Hypem::Playlist.popular.page(3).tracks
    # third_page = build_tracks_object(tracks)

    render json: first_page#.concat(second_page).concat(third_page)
  end

  def latest
  end

  def create
  end

  def update
  end

  def index
  end

  private

  def build_tracks_object(tracks)
    page = []
    tracks.each_with_index do |track, i|
      page[i] = {
        title: track.title,
        artist: track.artist,
        blog: track.site_name,
        post_url: track.post_url
      }
    end
    page
  end
end
