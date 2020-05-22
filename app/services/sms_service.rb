module SmsService
  def self.send_sms(message:, number:)
    puts "Sending SMS..."
    puts "#{message} to #{number}"
  end
end