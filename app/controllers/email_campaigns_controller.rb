class EmailCampaignsController < ApplicationController
	def new
		@email_campaign = current_user.email_campaigns.build
	end
	def create
		@email_campaign = current_user.email_campaigns.build(email_campaigns_params)
		if @email_campaign.save
			redirect_to dashboard_users_path
		else
			render :new
		end
	end
	private
	def email_campaigns_params
		params.require(:email_campaign).permit(:name, :subject, :text, :email_type)
	end
end
