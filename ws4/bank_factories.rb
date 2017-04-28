require_relative 'bank_account.rb'

class BankFactories
	def self.findFactory(product)
		case product
		when :term
			TermDepositFactory
		when :saving
			SavingFactory
		when :basic
			BankFactories
		end
	end
	def new_account(owner, initial_money, duration)
		account_number = generate_account_number
		return BankFactories.new(owner, initial_money, account_number, duration)
	end
	def generate_account_number
		return rand(100000)
	end
end
class SavingFactory < BankFactories
	def new_account(owner, initial_money, duration)
		account_number = generate_account_number
		Saving.new(owner, account_number, initial_money, 0.032)
	end
end
class TermDepositFactory < BankFactories
	def new_account(owner, initial_money, duration)
		rate = get_rate(duration)
		duration_day = get_duration_day(duration)
		if rate != "error" && duration_day != "error"
			account_number = generate_account_number
			TermDeposit.new(owner, account_number, initial_money, duration_day, rate)
		else puts "No such duration, please use number 6 or like :six_month. "
		end
	end
	def get_rate(duration)
		if duration == 6 || duration == :six_month
			return 0.056
		elsif duration == 12 || duration == :twelve_month
			return 0.0575
		else return "error"
		end
	end
	def get_duration_day(duration)
		if duration == 6 || duration == :six_month
			return 6*30
		elsif duration == 12 || duration == :twelve_month
			return 12*30
		else return "error"
		end
	end
end