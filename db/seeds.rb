# Passenger.delete_all
# Booking.delete_all

Airport.delete_all   
lax = Airport.create(code: "LAX", name: "Los Angeles")
sfo = Airport.create(code: "SFO", name: "San Francisco")
iad = Airport.create(code: "IAD", name: "Washington D.C.")
jfk = Airport.create(code: "NYC", name: "New York City")

duration = { "LAX_SFO" => 1.hour, "LAX_IAD" => 5.hours, "LAX_NYC" => 6.hours, "SFO_LAX" => 1.hour, "IAD_LAX" => 5.hours, "NYC_LAX" => 6.hours,
             "SFO_IAD" => 9.hours, "SFO_NYC" => 8.hours, "IAD_SFO" => 9.hours, "NYC_SFO" => 8.hours, 
             "IAD_NYC" => 1.hour, "NYC_IAD" => 1.hour }

Flight.delete_all


Airport.all.each do |airport1|
  Airport.all.each do |airport2|
    unless airport1 == airport2
      dur = duration["#{airport1.code}_#{airport2.code}"]
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_time: Time.now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_time: 3.hours.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_time: 6.hours.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_time: 1.day.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_time: (1.day + 6.hours).from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_time: 2.days.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_time: (2.days + 3.hours).from_now, duration: dur)
    end
  end
end