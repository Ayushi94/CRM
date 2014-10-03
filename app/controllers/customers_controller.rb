class CustomersController < ApplicationController
	def new
		@customer = current_user.customers.build
		@customer.emails.build
		@customer.contacts.build
		@customer.addresses.build
	end
	def create
		@customer = current_user.customers.build(customer_params)
		if @customer.save
			redirect_to dashboard_users_path
		else
			render :new
		end
	end
	def edit
		@customer = current_user.customers.find(params[:id])
	end
	def update
		@customer = current_user.customers.find(params[:id])

		if @customer.update(customer_params)
			redirect_to dashboard_users_path
		else
			render 'edit'
		end
	end
	def show
		@customer = current_user.customers.find(params[:id])
	end
	def destroy
		@customer = current_user.customers.find(params[:id])
		@customer.destroy
		redirect_to dashboard_users_path
	end

	private
	def customer_params
	params.require(:customer).permit(:first_name, :last_name, 
		emails_attributes: [:email_address, :email_type, :customer_id, :_destroy], 
		contacts_attributes: [:phone, :contact_type, :customer_id, :_destroy],
		addresses_attributes: [:line1, :line2, :address_type, :customer_id, :_destroy])
	end

end
