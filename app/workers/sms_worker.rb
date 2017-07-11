require 'twilio-ruby'
class SmsWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform(user_id)
    user = User.find(user_id)

    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    workout = ::WeeklyWorkout.new(user_id)

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: ENV['phone_number'],
      to: "+1#{user.phone_number}",
      body: "This is your workout for the week #{workout.exercises} with #{workout.sets_and_reps}"
    )
  end
end
