require 'date'
# require_relative 'Customer'

class Card
	# def self.findCard(type)
		# case type
		# when :credit
			# CreditCard
		# when :store
			# StoreCard
		# when :basic
			# Card
		# end
	# end
	def initialize(owner, expire_date, type)#, dob, phone, vip)
		@number = rand(10000000)
		@expire_date = Date.parse(expire_date)
		@cvv = rand(1000)
		@owner = owner.name
		# Customer.new(name, dob, phone, vip)
	end
end
class CreditCard < Card
	def initialize(name, expire_date, limit)#, dob, phone, vip)
		super
		@limit = limit
	end
end
class StoreCard < Card
	def initialize(name, expire_date, balance)#, dob, phone, vip)
		super
		@balance = balance
	end
end