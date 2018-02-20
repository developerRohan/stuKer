class PostsController < ApplicationController
	def new
		if current_user.connections.any?
			@post = Post.new
		else
			redirect_to dashboard_path , notice: 'add a social network'
		end
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to dashboard_path , notice: 'post was successfully created'
		else
			render :new
		end
	end

	private

	def post_params
		params.require(:post).permit(:content , :scheduled_at , :state , :user_id , :facebook , :twitter)
	end

end
