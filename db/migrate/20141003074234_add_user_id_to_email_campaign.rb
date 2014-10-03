class AddUserIdToEmailCampaign < ActiveRecord::Migration
  def change
    add_column :email_campaigns, :user_id, :integer
  end
end
