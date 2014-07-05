class SessionsController < ApplicationController
  
  def login

  end

  def login_attempt
  	user = User.find_by_username(params[:session][:username].downcase)
  	if user.password == (params[:session][:password])
  		check_password = true
  	end
  	if user && check_password
  	  session[:user_id] = user.id
  	  redirect_to user_path(user)
  	else
  	  flash[:error] = "Login Unsuccessful. Please try again."
  	  redirect_to root_path
  	end
  end

  def logout
  end
end
