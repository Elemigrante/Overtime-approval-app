namespace :notification do
  desc "Sends SMS notification to employees asking to log if they had overtime or not"
  task sms: :environment do
    puts "I'm a rake task"
  end

end
