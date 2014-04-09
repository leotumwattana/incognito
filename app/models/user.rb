class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation

  before_save :encrypt_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true

  has_and_belongs_to_many :tasks
  has_many :stats
  has_many :events, :foreign_key => "owner_id"
  has_many :messages

  def self.authenticate(email, password)
    user = User.find_by email: email
    if user and user.authenticate(password)
      user
    else
      nil
    end
  end

  def authenticate(password)
    self.fugu == BCrypt::Engine.hash_secret(password, self.salt)
  end

  protected

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fugu = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end