class OwnerFavorite < ApplicationRecord
    belongs_to :user
    belongs_to :owner
end
