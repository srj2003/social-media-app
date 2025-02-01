class PostsController < ApplicationController
  def create
    # Find User
    # @user = User.find_by(email: params[:email])
    if post = @user = @user.posts.create(post_params)
    # Create Post with user
       render json: post.as_json
    else
      render json: { message: 'Post not created - Issue Creating Posts', errors: post.errors.full_messages }
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image_url, :body)
  end
end