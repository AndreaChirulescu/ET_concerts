class VenuesController < ApplicationController
	before_filter :authenticate_user!, :get_venue, only: [:edit, :show, :update, :destroy]

	def index
		respond_to do |format|
			format.html
			format.js
			format.json{ render json: VenueDatatable.new(view_context) }
		end
	end

	def new
		@venue = Venue.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@venue = Venue.new(venue_params)

		respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @venue }
        # added:
        format.js   { render action: 'index', status: :created, location: @venue }
      else
        format.html { render action: 'new' }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		respond_to do |format|
      if @venue.update_attributes(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @venue }
        # added:
        format.js   { render action: 'index', status: :created, location: @venue }
      else
        format.html { render action: 'edit' }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def destroy
		respond_to do |format|
			if @venue.destroy
				format.js { render action: 'index', status: :ok, location: @status }
			end
		end
	end

	def show
		respond_to do |format|
			format.html
			format.js
		end
	end

	private
	def venue_params
		params.require(:venue).permit(:name, :city, :country_id)
	end

	def get_venue
		@venue = Venue.find(params[:id])
	end
end
