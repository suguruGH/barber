class User < ApplicationRecord
     #emailは小文字の意味            
        before_save { email.downcase! }
    #passwordを隠す    
        has_secure_password
        # has_many :stylists, dependent: :destroy
        # mount_uploader :image, ImageUploader 
        has_many :stylist_favorites, dependent: :destroy
        has_many :has_stylists, through: :stylist_favorites, source: :stylist
        validates :name,  presence: true, length: { maximum: 30 }
        validates :email, presence: true, length: { maximum: 255 },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }#唯一無二にする
        has_many :owner_favorites, dependent: :destroy
        has_many :has_owners, through: :owner_favorites, source: :owner        
end
