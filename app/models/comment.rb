class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :post_comments, ->(post) {where(["post_id = ?", post.id])}
end
