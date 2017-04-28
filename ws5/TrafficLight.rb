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