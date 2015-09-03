class SessionsController < ApplicationController
	
	def create
		oauth = request.env['omniauth.auth']
		@user = User.from_omniauth(oauth)
		session[:token] = oauth['credentials']['token']

		if @user.persisted?
			session[:user_id] = @user.id 
			redirect_to groups_path
		else 
			session[:user_id] = nil
			redirect_to groups_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	def omniauth_failure
		redirect_to root_path
	end
end
