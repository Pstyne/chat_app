class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 3, maximum: 30 }
  validates :password, presence: true, length: { minimum: 3, maximum: 30 }, confirmation: true
  validates_uniqueness_of :username, case_sensitive: false
  has_many :messages
end
