class Post < ApplicationRecord
  enum status: [:submitted, :approved, :rejected]
  
  belongs_to :user
  validates :date, :rationale, :overtime_request, presence: true
  validates :overtime_request, numericality: { greater_than: 0.0 }
  
  scope :posts_by, ->(user) { where(user_id: user.id) }
  
  after_save :update_audit_log
  
  private
  
  def update_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    audit_log.confirmed! if audit_log
  end
end