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