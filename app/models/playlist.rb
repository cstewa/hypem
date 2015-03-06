class Playlist < ActiveRecord::Base
  attr_accessible :name

  has_many :tracks
  belongs_to :user
end
