class Bookmark < ApplicationRecord
  # Associations
  belongs_to :post
  belongs_to :user

  # Validations
  validates :post, presence: true
  validates :user, presence: true

  # Scope
  scope :user_bookmarks, ->(user) {where(["user_id = ?", user.id])}

end
