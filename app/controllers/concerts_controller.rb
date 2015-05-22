class ConcertsController < ApplicationController
  before_filter :authenticate_user!
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

  def update_photo_1
    @concert = Concert.find(params[:id])
    @concert.photo1 = current_user
    if @concert.save
      render json: {sucess: true, message: current_user.email}
    else
      render json: {success: false, errors: @concert.errors }
    end
  end

  def update_photo_2
  end

  def update_text_1
  end

  def update_text_2
  end

  def update_interview
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
