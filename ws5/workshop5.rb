# Name: Ai Jian
# Student Number: 700476
require 'date'

#Exercise 1
class Staff
	attr_reader :name
	def initialize(name, dob)
		@name = name
		@dob = Date.parse(dob)
		@staff_number = rand(100)
	end
end
class Supervisor < Staff
	def initialize(name, department)
		@name = name
		@department = department
	end
end

class Customer
attr_reader :name
	def initialize(name, dob, phone, vip)
		@name = name
		@dob = Date.parse(dob)
		@phone = phone
		@vip = vip
	end
end

class Card
attr_reader :balance
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
		@name = owner.name
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
attr_reader :balance
attr_reader :name
	def initialize(name, expire_date, balance)#, dob, phone, vip)
		super
		@balance = balance
	end
end

class CardAgency
	def validate(card)
		if !card.nil?
			return true
		end
	end
	def charge(card, price)
		return card.balance - price
	end
end
class VisaAgency < CardAgency
	def initialize
	end
end
class StoreCardAgency < CardAgency
	def check_balance(card)
		return card.balance
	end
end

class Item
attr_reader :price
attr_accessor :stock_num
	def initialize(barcode, stock_num, price)
		@barcode = barcode
		@stock_num = stock_num
		@price = price
	end
end

class Sale
	def initialize
		@item = Array.new
		@total_price = 0
		# @policy
	end
	def add_item(item)
		@item << item
	end
	def calculate_price
		@item.each do |i|
			@total_price = i.price + @total_price
		end
		return @total_price
	end
	def add_discount_policy(policy)
		@policy = policy
	end
end

class Policy
	def initialize
		@item = Array.new
	end
	def add_item(item)
		@item << item
	end
	def calculate_price
		@item.each do |i|
			@total_price = i.price + @total_price
		end
		return @total_price
	end	
end

class SalesServer
	def initialize
		@sales = {}
		@policies = {}
	end
	def submitSale(sale)
		@sales[sale] = sale
	end
end

class StockInventoryServer
	def initialize
		@stock = {}
	end
	def queryStock(item)
		return @stock[item]
	end
	def removeStock(item, num)
		item.stock_num = item.stock_num - num
		@stock[item] = item.stock_num
	end
	def increaseStock(item, num)
	#assume that Item.stock_num is number of the item in stock
		item.stock_num = item.stock_num + num
		@stock[item] = item.stock_num
	end
	def addItem(item)
		@stock[item] = item.stock_num
	end
	def removeItem(item)
		@stock.delete_if{|key, value| key == item}
	end
end

class SecurityServer
	def releaseSale(sale)
		return true
	end
end

class MST
	def initialize(staff)
		@current_store_id = rand(10)
		@current_sales = Sale.new
		@user = staff.name
		@ss = SalesServer.new
	end
	def scan(item)
		@current_sales.add_item(item)
	end
	def check_stock(item)
		puts item.stock_num
	end
	def check_sales
		return @current_sales
	end
	def make_sale(card)
		if CardAgency.new.validate(card) == true
			if card.balance >= @current_sales.calculate_price
				cost = CardAgency.new.charge(card, @current_sales.calculate_price)
				puts "#{card.name} totally cost #{cost} dollars"
			else
				puts "No enough money"
			end
		end
	end
	def finaliseSale(sale)
		@ss.submitSale(sale)
	end
end


#Exercise 3
class TrafficLight
	attr_reader :state
	attr_reader :name
	def initialize(name, state)
		@name = name
		@state = state
	end
	def	next_state
		case @state
		when :green
			@state = :amber
		when :amber
			@state = :red
		when :red
			@state = :green
		end
	end
	def off
		@state = "Off"
	end
end

class Controller
	def initialize(ns_state, ew_state)
		@ns1 = TrafficLight.new("major1",ns_state)
		@ns2 = TrafficLight.new("major2",ns_state)
		@ew = TrafficLight.new("minor",ew_state)
	end
	def On
		if @ns1.state == :green && @ew.state == :red
			start_green
		elsif @ns1.state == :red
			if @ew.state == :amber
				start_red_amber
			elsif @ew.state == :green
				start_red_green
			end
		elsif @ns1.state == :amber && @ew.state == :red
			start_amber
		else
			puts "Invalid state!"
		end
	end
	def cycle
		if @ns1.state == :green
			@ns1.next_state
			@ns2.next_state
		elsif @ew.state == :green
			@ew.next_state
		else
			@ns1.next_state
			@ns2.next_state
			@ew.next_state
		end
	end
	def start_green
		while true do
			print
			sleep(7)
			cycle
			print
			sleep(0.5)
			cycle
			print
			sleep(4)
			cycle
			print
			sleep(0.5)
			cycle
		end
	end
	def start_red_green
		while true do
			print
			sleep(4)
			cycle
			print
			sleep(0.5)
			cycle
			print
			sleep(7)
			cycle
			print
			sleep(0.5)
			cycle
		end
	end
	def start_red_amber
		while true do
			print
			sleep(0.5)
			cycle
			print
			sleep(7)
			cycle
			print
			sleep(0.5)
			cycle
			print
			sleep(4)
			cycle
		end
	end
	def start_amber
		while true do
			print
			sleep(0.5)
			cycle
			print
			sleep(4)
			cycle
			print
			sleep(7)
			cycle
			print
			sleep(0.5)
			cycle
		end
	end
	def	print
		puts "#{@ns1.name} is #{@ns1.state}, #{@ns2.name} is #{@ns2.state} and #{@ew.name} is #{@ew.state}."
	end
end