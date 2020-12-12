class Bookmark < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post, presence: true
  validates :user, presence: true

  scope :user_bookmarks, ->(user) {where(["user_id = ?", user.id])}

end
