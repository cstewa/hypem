class UsersController < ApplicationController
  respond_to :json

  def new
    @user = User.new
  end

  def create
    user_params = params["user"]
    user = User.new(user_params)
    if user.save
      auto_login(user)
      render status: 201, json: { user: params["user"], current_user: current_user }
    else
      render status: 400, json: { errors: user.errors.full_messages.join(", ") }
    end
  end

  def destroy
  end
end
