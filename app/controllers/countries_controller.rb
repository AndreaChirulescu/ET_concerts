class CountriesController < ApplicationController
  before_filter :authenticate_user!, :get_country, only: [:edit, :show, :update, :destroy]

  def index
  	respond_to do |format|
      format.html
      format.js
      format.json { render json: CountryDatatable.new(view_context) }
    end
  end

  def new
  	@country = Country.new
  end

  def edit
    respond_to do |format|
			format.js
		end
  end

  def create
  	@country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render action: 'show', status: :created, location: @country }
        # added:
        format.js   { render action: 'index', status: :created, location: @country }
      else
        format.html { render action: 'new' }
        format.json { render json: @country.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @country.update_attributes(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render action: 'show', status: :created, location: @country }
        # added:
        format.js   { render action: 'index', status: :created, location: @country }
      else
        format.html { render action: 'edit' }
        format.json { render json: @country.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @country.destroy
        format.js {render action: 'index', status: :deleted, location: @country}
      end
    end
  end

  private

  def country_params
	params.require(:country).permit(:name, :alpha2, :alpha3)
  end

  def get_country
    @country = Country.find(params[:id])
  end

end
