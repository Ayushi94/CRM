class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :addresses, dependent: :destroy
	has_many :contacts, dependent: :destroy
	has_many :emails, dependent: :destroy
	validates :first_name, :last_name, presence: true
	accepts_nested_attributes_for :emails, reject_if: -> (email) { email[:email_address].blank? }
	accepts_nested_attributes_for :contacts
	accepts_nested_attributes_for :addresses
end
