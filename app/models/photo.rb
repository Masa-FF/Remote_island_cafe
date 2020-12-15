class Photo < ApplicationRecord
  
  belongs_to :user
  attachment :image
  
  validates :image, :title, :body, presence: true

end