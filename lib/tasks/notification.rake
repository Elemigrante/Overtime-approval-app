namespace :notification do
  desc "Sends SMS notification to employees asking to log if they had overtime or not"
  task sms: :environment do
    # User.all.each do |user|
    #   SmsService.send_sms
    # end
  end

end
