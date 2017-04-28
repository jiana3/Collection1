class Observer
	# def initialize()
		# if not (self.respond_to? :update)
			# throw Exception.new("Must implement method update")
		# end
	# end
	def update(amount, method)
	end
end
class BankCustomer < Observer
	def initialize(name)
		super
		@name = name
	end
	def update(amount, method)
		if method == "deposit"
		puts "#{@name} deposited #{amount} dollars"
		elsif method == "withdraw"
		puts "#{@name} withdrew #{amount} dollars"
		end
	end
end