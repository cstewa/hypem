class TracksController < ApplicationController
  def create
    playlist = Playlist.find_by(name: params[:playlist_name])
    track = Track.new(
      playlist_id: playlist.id,
      title: params[:title],
      artist: params[:artist],
      blog: params[:blog],
      url: params[:post_url]
    )
    if track.save
      #success response
    else
      #failed response
    end
  end

  def update
  end
end
