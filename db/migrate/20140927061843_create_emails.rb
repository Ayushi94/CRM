class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.timestamps
    	t.string :email_address
    	t.string :type
    end
  end
end
