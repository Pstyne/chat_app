class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    user = current_user
    user.is_online
    stream_from "appearance_channel"
  end

  def unsubscribed
    user = current_user
    user.is_offline
  end
end
