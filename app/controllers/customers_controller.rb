class CustomersController < ApplicationController
  before_action :load_customer, only: [:edit,:update,:show,:destroy]
  def load_customer
    @customer = current_user.customers.where(id: params[:id]).first
    unless @customer
      redirect_to dashboard_users_path, alert: 'Customer not found'
    end
  end
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
  end
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to dashboard_users_path
    else
      render 'edit'
    end
  end
  def show
    
  end
  def import

  end
  def save_import
    f = File.open(params[:customer][:browse].tempfile)
    CSV.foreach(f, headers: true).each do |record|
      customer = current_user.customers.build(first_name: record[0], last_name: record[1])
      if record[2]
        record[2].split("|").each do |email|
          customer.emails.build(email_address: email, email_type: Email::TYPES["Personal"])
        end
      end
      if record[3]
        record[3].split("|").each do |contact|
          customer.contacts.build(phone: contact, contact_type: Contact::TYPES["Mobile"])
        end
      end
      if record[4]
        record[4].split("|").each do |address|
          customer.addresses.build(line1: address, address_type: Address::TYPES["Residential"])
        end
      end
      customer.save!
    end
    redirect_to dashboard_users_path, alert: 'File imported'
  end
  def destroy
    
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
