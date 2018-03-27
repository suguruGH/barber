class Comment < ApplicationRecord
  belongs_to :share
  belongs_to :user
end
