class Post < ApplicationRecord
  enum status: [:submitted, :approved, :rejected]
  
  belongs_to :user
  validates :date, :rationale, presence: true
  
  scope :posts_by, ->(user) {where(user_id: user.id)}
end