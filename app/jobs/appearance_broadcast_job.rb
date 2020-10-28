class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(membership)
    ActionCable.server.broadcast "appearance_channel", render_json(membership)
  end

  private

    def render_json(membership)
      ApplicationController.renderer.render(json: membership)
    end
end
