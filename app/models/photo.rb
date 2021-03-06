class Photo < ApplicationRecord
  
  validates :image, :title, :body, presence: true
  
  belongs_to :user
  attachment :image
  has_many :comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search)
    if search
      Photo.where(['title LIKE ?', "%#{search}%"])
    else
      Photo.all
    end 
  end
  
end