class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 3, maximum: 30 }
  validates :password, presence: true, length: { minimum: 3, maximum: 30 }, allow_nil: true
  validates_uniqueness_of :username, case_sensitive: false
  after_update_commit { AppearanceBroadcastJob.perform_later self }
  has_many :messages

  def is_online
    self.update_attributes(online: true)
  end

  def is_offline
    self.update_attributes(online: false)
  end
end
