class Address < ActiveRecord::Base
	belongs_to :customer
	validates :line1, presence: true
	TYPES = { "Residential" => 1,"Office" => 2}
end
