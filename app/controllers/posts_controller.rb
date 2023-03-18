class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  rescue StandardError => e
    redirect_to users_path(@user, param: e)
  end

  def show
    @post = Post.find_by(id: params[:id])
    # begin
    #   @post = Post.find_by(id: params[:id])
    # rescue => error
    #   redirect_to users_path(@user, param: 'No such Post ID')
    # end
  end
end
