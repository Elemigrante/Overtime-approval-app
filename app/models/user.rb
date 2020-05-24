class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :audit_logs, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  validates :first_name, :last_name, :phone, presence: true
  
  validates :phone,
            format: { with:    /\A[0-9]*\z/,
                      message: "only allows integers" },
            length: { is: 10 }
  
  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end
end
