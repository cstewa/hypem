class Playlist < ActiveRecord::Base
  attr_accessible :name

  has_many :songs
  belongs_to :user
end
