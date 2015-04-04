class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  before_action :set_current_user, :authenticate_request

  #add rescues later

  private

  if decoded_auth_token

  end
end
