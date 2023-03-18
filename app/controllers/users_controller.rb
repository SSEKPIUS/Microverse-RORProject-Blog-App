class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  rescue StandardError => e
    redirect_to users_path(@user, param: e)
  end
end
