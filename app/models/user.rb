class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :hypem, :password, :password_confirmation, :first_name, :last_name

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, through: :inverse_friendships

  has_many :playlists
  has_many :songs, through: :playlists

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :hypem
  validates_uniqueness_of :hypem
end
