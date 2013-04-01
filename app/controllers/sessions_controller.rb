class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.where(username: params[:username]).first

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id #putting a userid into the cookie
			flash[:success]= "Welcome, you are logged in." 
			redirect_to root_path

		else
			flash[:error] = "Incorrect username or password."
			redirect_to login_path
		end	
	end

	def destroy
		session[:user_id] = nil
		flash[:success] ="You were logged out."
		redirect_to root_path
	end

end