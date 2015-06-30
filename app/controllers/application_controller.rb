class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_soundcloud

  def set_soundcloud
    @soundcloud_client = Soundcloud.new(
      client_id: 'd934a1c90d9d16288578bac5d6800e8e',
      client_secret: '23d8c41c38328fc9e4a138789977ba0a',
      redirect_uri: 'http://localhost:3000/auth/soundcloud/callback'
    )
  end

  private

end
