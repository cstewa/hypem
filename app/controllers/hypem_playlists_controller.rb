class HypemPlaylistsController < ApplicationController
  respond_to :json

  def popular
    #remember this paginates!
    tracks = Hypem::Playlist.popular.tracks
    first_page = build_tracks_object(tracks)

    # tracks = Hypem::Playlist.popular.page(2).tracks
    # second_page = build_tracks_object(tracks)

    # tracks = Hypem::Playlist.popular.page(3).tracks
    # third_page = build_tracks_object(tracks)
    render json: first_page[0..1]#.concat(second_page).concat(third_page)
  end

  def latest
  end

  def create
    playlist = current_user.playlists.build(name: params["name"])
    if playlist.save
      render status: 201, json: {}
    else
      render status: 400, json: { errors: playlist.errors.full_messages.join(", ") }
    end
  end

  def update
  end

  def index
    playlists = {}
    current_user.playlists.each do |playlist|
      playlists[playlist.name] = playlist.tracks.map do |track|
        {title: track.title, artist: track.artist, url: track.url, blog: track.blog}
      end
    end
    render status: 200, json: { playlists: playlists }
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
