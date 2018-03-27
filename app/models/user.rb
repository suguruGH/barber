class User < ApplicationRecord
     #emailは小文字の意味            
        before_save { email.downcase! }
        
    #アソシエーション
        has_many :stylist_favorites, dependent: :destroy
        has_many :has_stylists, through: :stylist_favorites, source: :stylist
        has_many :owner_favorites, dependent: :destroy
        has_many :has_owners, through: :owner_favorites, source: :owner 
        has_many :shares, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :comments, dependent: :destroy
        has_many :favorite_shares, through: :favorites, source: :share
        mount_uploader :image, ImageUploader

    #passwordを隠す    
        has_secure_password
        
    #バリデーション
        validates :password, presence: true, length: { minimum: 6 }
        validates :name,  presence: true, length: { maximum: 30 }
        validates :email, presence: true, length: { maximum: 255 },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }#唯一無二にする
end
