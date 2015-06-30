class SessionsController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_request, only: :create

  def new
  end

  def create
    user = User.find_by(hypem: params["hypem"]).try(:authenticate, params["password"])
    if user
      flash[:success] = "Logged In!"
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password"
      redirect_to root_path
    end
  end

  def create_from_soundcloud
    code = params[:code]
    auth_hash = @soundcloud_client.exchange_token(code: params[:code])
    User.find_or_create_by(soundcloud_access_token: auth_hash[:access_token]) do |user|
      user.hypem = "none"
      user.password = auth_hash[:access_token]
      user.soundcloud_expires_in = auth_hash[:expires_in]
      user.refresh_token = auth_hash[:refresh_token]
    end
    #sign in this user with rails session!
  end

  def show
    render status: 200, json: { current_user: current_user, logged_in: logged_in? }
  end

  def destroy
    #logout
    session[:hypem] = nil
    render status: 200, json: { current_user: "test" }
  end
end
