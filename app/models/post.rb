class Post < ApplicationRecord
  belongs_to :user
  validates :title, uniqueness: true
end
