namespace :notification do
  desc "Send SMS notification to users regarding information on workout"
  task sms: :environment do
    puts "Im in a rake task"
  end

end
