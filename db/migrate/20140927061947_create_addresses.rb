class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.timestamps
    	t.string :line1
    	t.string :line2
    	t.string :address_type
    end
  end
end
