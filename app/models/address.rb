class Address < ActiveRecord::Base
	belongs_to :customer
	validates :address, :zipcode, :city, :phone, :country, presence: true
end
