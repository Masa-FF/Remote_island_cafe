class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @photos = Photo.all.page(params[:page]).reverse_order
    #ページネーション(Kaminariを使用)
  end

  def show
    @photo = Photo.find(params[:id])
    @user = @photo.user
    @comment = Comment.new
    @comments = @photo.comments
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      flash[:notice] = '投稿しました。' 
      redirect_to photos_path
    else
      render 'photos/new'
    end
  end
  
  def destroy
     @photo = Photo.find(params[:id])
     @photo.destroy
     flash[:notice] = '投稿を削除しました。' 
     redirect_to photos_path
  end  
  
  #投稿機能用ストロングパラメーター
  private
  def photo_params
    params.require(:photo).permit(:image, :title, :body)
  end
  
end