require 'date'

class Customer
attr_reader :name
	def initialize(name, dob, phone, vip)
		@name = name
		@dob = Date.parse(dob)
		@phone = phone
		@vip = vip
	end
end