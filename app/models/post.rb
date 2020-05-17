class Post < ApplicationRecord
  enum status: [:submitted, :approved, :rejected]
  
  belongs_to :user
  validates :date, :rationale, :overtime_request, presence: true
  validates :overtime_request, numericality: {greater_than: 0.0}
  
  scope :posts_by, ->(user) {where(user_id: user.id)}
end