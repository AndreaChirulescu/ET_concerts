class BandsController < ApplicationController
  before_filter :authenticate_user!, :get_band, only: [:edit, :show, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.js
      format.json {render json: BandDatatable.new(view_context)}
    end
  end

  def new
    @band = Band.new
  end

  def edit
    respond_to do |format|
			format.js
		end
  end

  def create
    @band = band.new(band_params)

    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render action: 'show', status: :created, location: @band }
        # added:
        format.js   { render action: 'show', status: :created, location: @band }
      else
        format.html { render action: 'new' }
        format.json { render json: @band.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @band.update_attributes(band_params)
				debugger
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render action: 'show', status: :created, location: @band }
        # added:
        format.js   { render action: 'show', status: :created, location: @band }
      else
        format.html { render action: 'edit' }
        format.json { render json: @band.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @band.destroy
			redirect_to bands_path
		end
  end

  def show
    respond_to do |format|
			format.html
			format.js
		end
  end

  private
  def bands_params
    params.require(:band).permit(:name, :country_id)
  end

  def get_band
    @band = Band.find(params[:id])
  end
end
