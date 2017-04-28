require_relative 'bank_customer.rb'

class Subject
	def initialize(owner, account_number, initial_money, duration_day, rate)
		@customer = BankCustomer.new(owner)
		@observers = Array.new
		attach(owner)
	end
	def attach(observer)
		@observers << observer
	end
	def detach(observer)
		@observers.delete(observer)
	end
	def notify(amount, method)
		@observers.each do |o|
			o.update(amount, method)
		end
	end
end
class BankAccount < Subject
	def initialize(owner, account_number, initial_money, duration_day, rate)
		super
		@owner = owner
		@account_number = account_number
		@balance = initial_money
		@duration_day = duration_day
		@rate = rate
		@deposit_date = Time.now
		@interest_pre = get_interest
	end
	def deposit(money)
		@balance = @balance + money
		@customer.update(money, "deposit")
	end
	def withdraw(money)
		if money <= @balance
			@balance = @balance - money
			@customer.update(money, "withdraw")
		else puts "No enough money. "
		end
	end
	def show
		puts @balance
	end
	
end
class Interest < BankAccount
	def get_interest
	return @balance + @balance * @rate
		# sleep(2)
	end
end
class Saving < Interest
	def initialize(owner, account_number, initial_money, rate)
		super owner, account_number, initial_money, 0, rate
		puts "After a month included interest the deposit will be #{@interest_pre}"
	end
end
class TermDeposit < Interest
	def initialize(owner, account_number, initial_money, duration_day, rate)
		super owner, account_number, initial_money, duration_day, rate
		# interest_pre = get_interest
		puts "After #{@duration_day/30} months included interest the deposit will be #{@interest_pre}"
	end
	def deposit(money)
		puts "The money cannot be deposited during the investment period. "
	end
	def withdraw(money)
		if (Time.now - @deposit_date).round() > @duration_day * 24 * 60 * 60
			super
		else puts "The money cannot be withdrew during the investment period. "
		end
	end
end