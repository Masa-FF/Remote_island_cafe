class PhotosController < ApplicationController
  #before_action :authenticate_user!
  
  def index
  end

  def show
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
    redirect_to photos_path
    else
    render 'photos/new'
    end
  end

  def edit
  end
  
  #投稿機能用ストロングパラメーター
  private
  def photo_params
    params.require(:photo).permit(:image, :title, :body)
  end
  
end
