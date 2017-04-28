class Item
attr_reader :price
attr_accessor :stock_num
	def initialize(barcode, stock_num, price)
		@barcode = barcode
		@stock_num = stock_num
		@price = price
	end
end