namespace :notification do
  desc "Send SMS notification to users regarding information on workout"
  task sms: :environment do
    # 1. Schedule to run everyday to user
    # 2. Iterate over all users
    # 3. Skip Admin users
    # 4. Send a message that has workout for the day
    # User.all.each do |user|
    #   SmsTool.send_sms()
  end
end
