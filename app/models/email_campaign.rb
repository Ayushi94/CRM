class EmailCampaign < ActiveRecord::Base
	belongs_to :user
	TYPES = { "Personal" => 1,"Official" => 2}
	after_create :deliver_campaign_emails
	private
	def deliver_campaign_emails
		emails = Email.includes(:customer).where(email_type: self.email_type)
		emails.each do|email|
			Campaign.delay.send_mail(email.customer, self,email.email_address)
		end
	end
end
