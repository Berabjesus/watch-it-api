class User < ApplicationRecord
  has_secure_password
  has_many :watchlists, dependent: :destroy
  validates :username, :password, :password_confirmation, presence: true
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :username, uniqueness: true
end
