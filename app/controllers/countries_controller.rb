class CountriesController < ApplicationController
  def index
  	@countries = Country.all
  end

  def new
  	@country = Country.new
  end

  def edit
  	@country = Country.find(params[:id])
  end

  def create
  	@country = Country.new(country_params)

  	if @country.save
  	  flash[:notice] = "Country successfuly created!"
      redirect_to countries_path
    else
    	render :new
  	end
  end

  def update
  	@country = Country.find(params[:id])

  	if @country.update_attributes(country_params)      
      flash[:notice] = "Country successfuly updated!"
      redirect_to countries_path
    else
      render :edit
    end
  end

  def destroy
  	@country = Country.find(params[:id]).destroy
    flash[:notice] = "Country successfuly deleted"
    redirect_to countries_path
  end

  private
  def country_params
	params.require(:country).permit(:name, :alpha2, :alpha3)
  end
end
