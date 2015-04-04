class SessionsController < ApplicationController
  respond_to :json

  def new
  end

  def create
    # if login(params["user"]["hypem"], params["user"]["password"])
    #   render status: 200, json: { current_user: current_user }
    # else
    #   render status: 400, json: { error: "Something went wrong"}
    # end
    @user = User.find_by(hypem: params["user"]["hypem"])
    if @user.authenticate(params["user"]["password"])
      session[:hypem] = @user.hypem
      render status: 200, json: { current_user: @user.hypem }
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
