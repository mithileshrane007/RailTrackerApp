class Company < ActiveRecord::Base
	has_many :user
	has_secure_password
end
