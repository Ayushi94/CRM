class Contact < ActiveRecord::Base
	belongs_to :customer
	TYPES = { "Mobile" => 1,"Office" => 2, "Home" => 3}
end
