class Post < ApplicationRecord
  # Association
  belongs_to :user

  # Post validations
  validates :title, presence: true, uniqueness: true
  validates :user, presence: true

  # Mount the image uploader from carrierwave
  mount_uploader :img, ImageUploader

  # Associations
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
