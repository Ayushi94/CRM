class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
        t.timestamps
        t.string :phone
        t.string :type
    end
  end
end
