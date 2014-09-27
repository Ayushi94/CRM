class User < ActiveRecord::Base
	has_many :customers
end
