class PostsController < ApplicationController
	before_action :authenticate_user!
	

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
	def destroy
		@post = Post.find(params[:id])
		if @post.user_id == current_user.id
			@post.destroy
		end
		@event = @post.event_id
		redirect_to(event_path(@event))
	end



	private
		def post_params
			params.require(:post).permit(:comments)
		end
end
