class ConcertsController < ApplicationController
  def index
  	@concerts = Concert.sorted.paginate(per_page: 10, page: params[:page])
  end

  def new
  	@concert = Concert.new
  end

  def edit
  	@concert = Concert.find(params[:id])
  end

  def create
  	@concert = Concert.new(concert_params)

  	if @concert.save
  	  flash[:notice] = "concert successfuly created!"
      redirect_to concerts_path
    else
    	render :new
  	end
  end

  def update
  	@concert = concert.find(params[:id])

  	if @concert.update_attributes(concert_params)
      flash[:notice] = "concert successfuly updated!"
      redirect_to concerts_path
    else
      render :edit
    end
  end

  def destroy
  	@concert = concert.find(params[:id]).destroy
    flash[:notice] = "concert successfuly deleted"
    redirect_to countries_path
  end

  private
  def concert_params
  	params.require(:country).permit(:name, :alpha2, :alpha3)
  end
end
