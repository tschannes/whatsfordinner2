class User < ActiveRecord::Base
  require 'bcrypt'

  attr_accessible :remember_token, :name, :email, :password, :password_confirmation, :role
  has_secure_password

  before_save :valid_password

  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates_presence_of :email
  validates :email, :uniqueness => true

  before_save { |user| user.email = email.downcase }
  before_create :create_remember_token

  has_many :reservations
  has_many :restaurants, through: :reservations

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def valid_password
      :password == :password_confirmation
    end
end
