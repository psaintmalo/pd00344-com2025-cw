class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :commentText, presence: true
  scope :post_comments, ->(post) {where(["post_id = ?", post.id])}
end
