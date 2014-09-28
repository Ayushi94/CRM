class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :addresses
	has_many :contacts
	has_many :emails
	validates :first_name, :last_name, presence: true
end
