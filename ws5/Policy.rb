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