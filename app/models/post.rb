class Post < ApplicationRecord
  enum status: [:submitted, :approved, :rejected]
  
  belongs_to :user
  validates :date, :rationale, presence: true
end