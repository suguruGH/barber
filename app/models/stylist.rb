class Stylist < ApplicationRecord
    has_many :stylist_favorites, dependent: :destroy
    has_many :has_users, through: :stylist_favorites, source: :user
    
    has_many :agreements, dependent: :destroy
    has_many :has_owners, through: :agreements, source: :owner
    has_secure_password
end
