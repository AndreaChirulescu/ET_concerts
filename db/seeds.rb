# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
countries = Country.create([{name: 'United States of America', alpha2: '', alpha3: ''},
						   {name: 'Norway', alpha2: '', alpha3: ''},
						   {name: 'England', alpha2: '', alpha3: ''}])

bands = Band.create([{name: 'Motorhead', country_id: countries.last.id },
					 {name: 'Iron Maiden', country_id: countries.last.id},
					 {name: 'Lamb of God', country_id: countries.first.id}])

statuses = Status.create([{name: "Accred. requested", color: "yellow"},{name: "Photo Approved", color:"green"},
					  {name: "Text Approved", color:"green"},{name: "Photo and Text approved", color:"green"},
					  {name: "Rejected", color:"red"},{name: "CANCELLED", color:"red"}])

venues = Venue.create([{name: "MetalFest", city: "London"}, {name: "Festival", city: "Manchester"},
	{name: "Motorboat", city: "Berlin"},{name: "Ozzfest", city: "Berlin"},
	{name: "Venue 1", city: "London"},{name: "Venue 2", city: "London"},
	{name: "Venue 3", city: "London"},{name: "Venue 4", city: "Manchester"}])

concerts = Concert.create([ {venue_id: venues.first.id, on_date: Date.today + 20.days, status_id: statuses.first.id },
	{venue_id: venues.first.id, on_date: Date.today + 45.days, status_id: statuses.first.id },
	{venue_id: venues.last.id, on_date: Date.today + 50.days, status_id: statuses.last.id}])

#concert_bands venue_concerts




