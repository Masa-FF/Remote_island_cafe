class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    #favoriteを記述する
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
    redirect_to photos_path
    else
    render 'photos/new'
    end
  end

  def edit
  end
  
  def destroy
     @photo = Photo.find(params[:id])
     @photo.destroy
     redirect_to photos_path
  end  
  
  #投稿機能用ストロングパラメーター
  private
  def photo_params
    params.require(:photo).permit(:image, :title, :body)
  end
  
end