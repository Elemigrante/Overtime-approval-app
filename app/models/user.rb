class User < ApplicationRecord
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, :last_name, presence: true
  
  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end
end
