class Song < ActiveRecord::Base
  attr_accessible :url
  belongs_to :playlist

  CLIENT = Soundcloud.new(:client_id => '0bf253a58ca9b42631a739789bdc25c7',
      :client_secret => '0347fb41cfb4fd5e06d8aec6b97cc094')

  def soundcloud_player
    SC::Track.embed_info(self.url)
  end
end
