class Owner < ApplicationRecord
    has_many :owner_favorites, dependent: :destroy
    has_many :has_users, through: :owner_favorites, source: :user
    
    has_many :agreements, dependent: :destroy
    has_many :has_stylists, through: :agreements, source: :stylist
    
end
