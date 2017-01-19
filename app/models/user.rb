class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :playlists, foreign_key: :creator_id
  has_many :sound_treks, through: :playlists

  # POSSIBLE METHOD:
  # def get_current_location

  # end

  # BCrypt and Authentication
  def password
    @password ||= BCrypt::Password.new(hashed_password) # hangs on to the plain text password and compares it against the entered plain text password for authentication
  end

  def password=(plain_text_new_password)
    @password = BCrypt::Password.create(plain_text_new_password) # this transforms a new, plain text password into a hashed password
    self.hashed_password = @password # stores the hashed password in the database within the 'hashed_password' column of the 'users' table
  end

  def authenticate(plain_text_password)
    # 'self.password' below calls the 'password' getter method above
    # '==' below is BCrypt's special version of '=='
    self.password == plain_text_password
  end

end


# NOTES

# Longhand for the '||=' expression in the getter method above:

  # if @password
  #   @password
  # else
  #   @password = Password.new(hashed_password)
  #   return Password.new(hashed_password)
  # end

  # PSEUDOCODE

    # if @password exists, then return @password
    # otherwise instantiate a new Password object via BCrypt, using the 'hashed_password' and return that Password object


# the BCrypt::Password object contains information such as the  "salt" used in hashing the plain text password
