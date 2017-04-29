class User < ActiveRecord::Base
	has_secure_password
	# Validations
 	validates_presence_of :email, :first_name, :last_name, :username
  	validates :email, format: { with: /(.+)@(.+).[a-z]{2,4}/, message: "%{value} is not a valid email" }
  	validates :username, length: { minimum: 3 }

	# Users can have interests
	acts_as_taggable_on :interests

	# Find a user by email, then check the username is the same
	# def self.authenticate username, email
		# user = User.find_by(email: email)
		# if user && user.username.eql?(username)
			# return user
		# else
			# return nil
		# end
	# end

	def full_name
		first_name + ' ' + last_name
	end
end
