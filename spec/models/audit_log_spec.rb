require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:audit_log) { FactoryBot.create(:audit_log, user: user) }
  
  describe 'creation' do
    it 'can be created' do
      expect(audit_log).to be_valid
    end
  end
  
  describe 'validations' do
    it 'has a user associated' do
      audit_log.user_id = nil
      expect(audit_log).to_not be_valid
    end
    
    it 'has a status' do
      audit_log.status = nil
      expect(audit_log).to_not be_valid
    end
    
    it 'has a start_date' do
      audit_log.start_date = nil
      expect(audit_log).to_not be_valid
    end
    
    it 'has a start_date of 6 days ago' do
      expect(audit_log.start_date).to eq(Date.today - 6.days)
    end
  end
end
