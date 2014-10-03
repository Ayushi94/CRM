class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
        t.timestamps
        t.string :phone
        t.string :contact_type
    end
  end
end
