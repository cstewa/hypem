module SoundcloudWrapper
  class Track
    CLIENT = Soundcloud.new(:client_id => '0bf253a58ca9b42631a739789bdc25c7',
        :client_secret => '0347fb41cfb4fd5e06d8aec6b97cc094')

    def self.embed_info(url)
      embed_info = CLIENT.get('/oembed', url: url)
      embed_info['html'].sub("400", "120").html_safe
    end

    def self.get_url(query)
      tracks = CLIENT.get('/tracks', :q => query)
      tracks[0][:permalink_url]
    end

    #search by title, song length and permalink url and make sure both only have the name of the artist and remix if applicaable
  end
end
