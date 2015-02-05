class Flight < ActiveRecord::Base

	belongs_to :to_airport,   class_name: "Airport"
	belongs_to :from_airport, class_name: "Airport"

	def self.get_dates
		pluck(:start_time).map{ |d| [d.strftime("%m/%d/%Y"), d.to_date]}.uniq
	end

	def self.search(params)
		if params[:search] && !params[:date].blank?
		  date = params[:start_time]
		  Flight.where(from_airport_id: params[:from], to_airport_id: params[:to])
		        .includes(:from_airport, :to_airport) # prevents N + 1 queries
		else
		  Flight.none
		end
	end

	def date_formatted
		date.strftime("%m/%d/%Y")
	end



end
