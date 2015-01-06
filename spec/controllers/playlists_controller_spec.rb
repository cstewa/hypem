require 'spec_helper'

describe PlaylistsController do
  describe 'GET :popular' do
    it 'retrieves popular playlists from Hypem' do
      expect(Hypem::Playlist).to receive(:popular) #and return properly formatted mock
      get :popular
    end
  end
end
