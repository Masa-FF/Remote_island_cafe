class Photo < ApplicationRecord
  
  validates :image, :title, :body, presence: true
  
  belongs_to :user
  attachment :image
  
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    self.favorites.where(user_id: user.id).exists?
  end

end