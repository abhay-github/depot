class SessionsController < ApplicationController
  def new
  end

  def create
  	usr = User.find_by(name: params[:name])
  	if usr and usr == usr.authenticate(params[:password])
  		session[:user_id] = usr.id
  		redirect_to admin_path

  	else
  		flash[:danger] = 'username/password is incorrect'
  		# render 'new'
  		redirect_to new_session_path
  	end
  end

  def destroy
  	# session[:user_id] = nil
    session.delete :user_id
  	redirect_to store_path, flash: { success: 'You have succesfully logged out' }
  end
end
