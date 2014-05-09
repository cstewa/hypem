class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :hypem, :first_name, :last_name

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :playlists
  has_many :songs, through: :playlists

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end
