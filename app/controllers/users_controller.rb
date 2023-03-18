class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue => error
      redirect_to users_path(@user, param: 'No such ID')
    end
  end
end
