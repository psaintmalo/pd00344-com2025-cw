class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :text, presence: true

  has_many :comments, dependent: :destroy
end
