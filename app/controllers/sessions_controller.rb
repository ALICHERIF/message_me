class SessionsController < ApplicationController
  def new
  end
  def create
  user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
  flash[:success] = "successful login "
  redirect_to root_path
    else
      flash.now[:error] = "there was something wrong with your login details "
      render 'new'
      #binding.break
    end
  end
  def destroy
  session[:user_id] = nil
  #binding.break
  flash[:success] = "successful logout "
  redirect_to root_path
end

end
