class SessionsController < ApplicationController
  respond_to :json

  def new
  end

  def create
    if login(params["user"]["hypem"], params["user"]["password"])
      render status: 200, json: { current_user: current_user }
    else
      render status: 400, json: { error: "Something went wrong"}
    end
  end

  def show
    render status: 200, json: { current_user: current_user, logged_in: logged_in? }
  end

  def destroy
    logout
    render status: 200, json: { current_user: current_user }
  end
end
