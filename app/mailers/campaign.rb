class Campaign < ActionMailer::Base
  default from: "from@example.com"
  def send_mail(user,campaign,email_address)
  	@user = user
  	@campaign = campaign
  	mail(to: email_address,subject: @campaign.subject)
  end
end
