class Playlist < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true

  belongs_to :creator, class_name: "User"
  has_many :sound_treks
  has_many :locations, through: :sound_treks
end
