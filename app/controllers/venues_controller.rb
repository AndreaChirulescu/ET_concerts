class VenuesController < ApplicationController
	def index
		@venues = Venue.all
	end

	def new
	end
end 