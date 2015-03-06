class TracksController < ApplicationController
  def create
    playlist = Playlist.find(params[:track][:playlist_id])
    track = playlist.build(
      title: params[:track][:title],
      artist: params[:track][:artist],
      blog: params[:track][:site_name],
      post_url: params[:track][:post_url]
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
