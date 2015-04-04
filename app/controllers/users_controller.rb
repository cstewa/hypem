class UsersController < ApplicationController
  respond_to :json

  def new
    @user = User.new
  end

  def create
    binding.pry
    user_params = params["user"]
    user = User.new(user_params)
    if user.save
      render status: 200, json: { auth_token: user.generate_auth_token }
    else
      render status: 400, json: { errors: user.errors.full_messages.join(", ") }
    end
  end

  def destroy
  end
end
