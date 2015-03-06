class UsersController < ApplicationController
  respond_to :json

  def new
    @user = User.new
  end

  def create
    binding.pry
    user_params = JSON.parse(params[:user])
    user_params.tap do |hash|
      hash["first_name"] = hash["first"]
      hash["last_name"] = hash["last"]
      hash.delete("first")
      hash.delete("last")
    end
    user = User.new(user_params)
    if user.save
      auto_login(user)
      render status: 201, json: { user: JSON.parse(params[:user]) }
    else
      render status: 400, json: { errors: "log error here" }
    end
  end

  def errors
    @errors = @user.errors.messages
  end

  def destroy
  end
end
