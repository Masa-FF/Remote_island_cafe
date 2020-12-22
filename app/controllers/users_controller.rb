class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: @user).page(params[:page]).reverse_order
    #ページネーション(Kaminariを使用)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to edit_user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user == current_user
      @user.update(user_params)
      flash[:notice] = 'プロフィールを編集しました。' 
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(current_user)
    end  
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
  
end