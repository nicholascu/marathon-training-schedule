class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, :presence => true
  validates :email, :presence => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
  	if password.present?
  		self.salt = BCrypt::Engine.generate_salt
  		self.encrypted_passwords = BCrypt::Engine.hash_secret(password, salt)
  	end
  end
  def clear_password
  	self.password = nil
  end
end
