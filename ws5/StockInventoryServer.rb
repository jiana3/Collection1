require_relative 'Item.rb'

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