class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @url = Youtubelist.new
    @youtubelist = Youtubelist.where(user_id: @user.id)

  end
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def admin
    @youtubelist = Youtubelist.where(user_id: @user.id)
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
