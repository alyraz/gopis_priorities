require 'digest/md5'

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :checkins
  
  #validates_presence_of :name, :email, :password --- currently not requiring pw due to Google Login

  #validates :email, format:     { with: VALID_EMAIL_REGEX },
                    #uniqueness: { case_sensitive: false }

  before_create :encrypt_password

  def authenticate(attempt)
    self.id if self.password == Digest::MD5.hexdigest(attempt)
  end

  private
  def encrypt_password
    self.password = Digest::MD5.hexdigest(self.password)
  end
end
