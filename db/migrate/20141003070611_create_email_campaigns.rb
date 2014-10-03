class CreateEmailCampaigns < ActiveRecord::Migration
  def change
    create_table :email_campaigns do |t|
    	t.string :name
    	t.string :subject
    	t.string :text
    	t.string :email_type

      t.timestamps
    end
  end
end
