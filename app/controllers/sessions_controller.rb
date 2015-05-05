class SessionsController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_request, only: :create

  def new
  end

  def create
    user = User.find_by(hypem: params["user"]["hypem"]).try(:authenticate, params["user"]["password"])
    if user
      render status: 200, json: { auth_token: user.generate_auth_token, hypem: user.hypem }
    else
      render status: 400, json: { error: "Something went wrong"}
    end
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
