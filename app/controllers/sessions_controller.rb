class SessionsController < ApplicationController
  def new
  end

  def create 
    user = login(params[:hypem], params[:password])
    respond_to do |format|
      format.html {
        if user
          redirect_to root_path #, notice: "Logged in"
        else
          redirect_to root_path #, alert: "Email or password invalid"
        end
      }
      format.js { render layout: false }
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
