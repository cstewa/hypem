class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        auto_login(@user)
        dfdfs
        format.js { render :js => "window.location.href='https://google.com'" }
      else
        format.js { render :new }
        #do the errors thing
      end
    end
  end

  def errors
    @errors = @user.errors.messages
  end

  def destroy
  end
end
