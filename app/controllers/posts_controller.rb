class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :
	

	def new
		@event = Event.find(params[:id])
		@post = Post.new
		render 'new'
	end

	def create
		@post = Post.new post_params
		@post.user = current_user
		@event = Event.find(params[:id])
		@post.event = @event

		if @post.save
			flash[:notice] = "Post submitted"
			redirect_to(event_path(@event))
		else
			flash[:alert] = "Post not submitted"
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end



	private
		def post_params
			params.require(:post).permit(:comments)
		end

		# def authorized?
		#   unless session[:user_id]
		#     redirect_to => :controller => "users", :action => "login"
		#   end
		# end
end
