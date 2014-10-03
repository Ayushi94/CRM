class AddCustomerIdToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :customer_id, :integer
  end
end
