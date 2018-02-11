class StylistFavorite < ApplicationRecord
    belongs_to :user
    belongs_to :stylist
end
