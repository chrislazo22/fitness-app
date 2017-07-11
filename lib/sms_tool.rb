module SmsTool
  def self.send_sms
    @user = User.find(1)
    SmsWorker.perform_async(@user.id)
  end
end
