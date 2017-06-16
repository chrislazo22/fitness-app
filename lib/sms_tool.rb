module SmsTool
  account_sid = ENV['account_sid']
  auth_token = ENV['auth_token']

  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_sms(number:, message:)
    @client.messages.create(
      from: ENV['phone_number'],
      to: "+1#{number}",
      body: "#{message}"
    )
  end
end
