class AddCustomerIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :customer_id, :integer
  end
end
