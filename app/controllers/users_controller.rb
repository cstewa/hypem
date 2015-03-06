class UsersController < ApplicationController
  respond_to :json

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      render status: 201
    else
      render status: 400, json: { erros: "log error here" }
    end
  end

  def errors
    @errors = @user.errors.messages
  end

  def destroy
  end
end
