class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    photo = Photo.find(params[:photo_id])
    comment = current_user.comments.new(comment_params)
    comment.photo_id = photo.id
    comment.save
    flash[:notice] = 'コメントを投稿しました。' 
    redirect_to photo_path(photo)
  end
  
  def destroy
    Comment.find_by(id: params[:id], photo_id: params[:photo_id]).destroy
    flash[:notice] = 'コメントを削除しました。' 
    redirect_to photo_path(params[:photo_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
