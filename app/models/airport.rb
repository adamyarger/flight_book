class Airport < ActiveRecord::Base

	has_many :arriving_flights,  class_name: "Flight", dependent: :destroy, foreign_key: "from_airport_id"
	has_many :departing_flights, class_name: "Flight", dependent: :destroy, foreign_key: "to_airport_id"

end
