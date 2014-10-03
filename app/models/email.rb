class Email < ActiveRecord::Base
	belongs_to :customer
	TYPES = { "Personal" => 1,"Official" => 2}
end
