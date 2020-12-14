class Post < ApplicationRecord
  # Association
  belongs_to :user

  # Post validations
  validates :title, presence: true, uniqueness: true
  validates :user, presence: true

  # Associations
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
