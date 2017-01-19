class Location < ActiveRecord::Base
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :sound_treks
  has_many :playlists, through: :sound_treks
  has_many :trekkers, through: :playlists, source: :creator
end
