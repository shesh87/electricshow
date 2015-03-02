class UsersController < ApplicationController
	before_action :authenticate_user!

	def new
		@user = User.new
		render 'new'
	end

	def create
		@user = User.new user_params
		if @user.save
			flash[:notice] = "Account created succesfully"
			redirect_to(user_path(@user))
		else
			flash[:error] = "Account not created"
			render 'new'
		end
	end

	def method_name
		
	end







	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :user_name, :email, :birthdate)
		end

end
