class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  validates :first_name, :last_name, :phone, presence: true
  
  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end
end
