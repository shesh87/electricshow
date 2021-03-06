class UsersController < ApplicationController
	before_action :authenticate_user!

	def new
		@user = User.new
		render 'new'
	end

	def create
		@user = User.new user_params
		if @user.save
			redirect_to(user_path(@user))
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: @user.id).order(created_at: :asc)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to(user_page_path(@user))
		else
			render edit_user_registration_path(@user)
		end
	end



	
	







	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :user_name, :email, :birthdate, :picture)
		end

end
