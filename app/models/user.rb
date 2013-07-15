class User < ActiveRecord::Base
  require 'bcrypt'

  attr_accessible :remember_token, :name, :email, :password, :password_confirmation, :points, :role
  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create
  validates_presence_of :email
  validates :email, :on => :create, :uniqueness => true

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_many :reservations
  has_many :restaurants, through: :reservations

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
