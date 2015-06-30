class UsersController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_request

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      flash[:success] = "Signed up!"
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end

  def destroy
  end















end
