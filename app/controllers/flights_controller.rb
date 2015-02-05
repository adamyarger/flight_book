class FlightsController < ApplicationController

	def index
		@flights = Flight.search(params)
		@airports = Airport.pluck(:code, :id).sort
		@date = Flight.get_dates
		@passenger = (1..4).map {|p| [p.to_s + " passenger".pluralize(p), p]}
	end

end
