class UsersController < ApplicationController
	def dashboard
		@customer = current_user.customers
		@email_campaign = current_user.email_campaigns
	end
end
