class SoundTrek < ActiveRecord::Base
  # validates :radius, presence: true

  belongs_to :playlist
  belongs_to :location
end
