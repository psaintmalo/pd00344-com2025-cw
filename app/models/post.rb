class Post < ApplicationRecord
  belongs_to :user
  validates :title, uniqueness: true

  has_many :comments, dependent: :destroy
end
