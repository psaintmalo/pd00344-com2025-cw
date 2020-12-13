class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :user, presence: true

  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
