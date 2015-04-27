class Passenger < ActiveRecord::Base

	has_many :tickets
	has_many :flights,  :through => :bookings
	has_many :bookings, :through => :tickets

end
