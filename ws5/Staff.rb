require 'date'

class Staff
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