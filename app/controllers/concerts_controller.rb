class ConcertsController < ApplicationController
  before_filter :authenticate_user!
  def index
    # @q = Concert.sorted.ransack(params[:q])
    # @concerts = @q.result.includes(:venue, :status).paginate(per_page: 10, page: params[:page])
    respond_to do |format|
      format.html
      format.json { render json: ConcertDatatable.new(view_context) }
    end
  end

  def my_concerts
    respond_to do |format|
      format.html
      format.json { render json: MyConcertDatatable.new(view_context) }
    end
  end

  def new
    @concert = Concert.new
    @concert.concert_lists.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
    @concert = Concert.find(params[:id])
    
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def create
    @concert = Concert.new(concert_params)
    respond_to do |format|
      if @concert.save
        format.js { render action: 'show', status: :created, location: @concert }
        #  ConcertMailer.global_notification(@concert).deliver_later
        format.html { render 'index' }
      else
        format.js   { render json: @concert.errors, status: :unprocessable_entity }
        format.html { render @concert.errors }
      end
    end
  end

  def update
    @concert = Concert.find(params[:id])
    #respond_to do |format|
    #  if @concert.update_attributes(concert_params)
    #    debugger
    #    # format.js { render action: 'show', status: :created, location: @concert }
    #    format.js   { render action: 'index', status: :created, location: @status }
    #  else
    #    format.js { render json: @concert.errors, status: :unprocessable_entity }
    #  end
    # end
    debugger
      if @concert.update_attributes(concert_params)
       flash[:notice] = "concert successfuly updated!"
       redirect_to concerts_path
      else
       render :edit
      end

    # if @concert.update_attributes(concert_params)
    #  flash[:notice] = "concert successfuly updated!"
    #  redirect_to concerts_path
    # else
    #  render :edit
    # end
  end

  def update_photo_1
    @concert = Concert.find(params[:id])
    @concert.photo1 = current_user.id
    @concert.save
    ConcertMailer.assign(@concert).deliver_later
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
  end

  def destroy_photo_1
    @concert = Concert.find(params[:id])
    @concert.photo1 = nil
    @concert.save
    ConcertMailer.assign(@concert).deliver_later
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
  end

  def update_photo_2
    @concert = Concert.find(params[:id])
    @concert.photo2 = current_user.id
    @concert.save
    ConcertMailer.assign(@concert).deliver_later
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
  end

  def destroy_photo_2
    @concert = Concert.find(params[:id])
    @concert.photo2 = nil
    @concert.save
    ConcertMailer.assign(@concert).deliver_later
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
  end

  def update_text_1
    @concert = Concert.find(params[:id])
    @concert.text1 = current_user.id
    @concert.save
    ConcertMailer.assign(@concert).deliver_later
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
  end

  def destroy_text_1
    @concert = Concert.find(params[:id])
    @concert.text1 = nil
    @concert.save
    ConcertMailer.assign(@concert).deliver_later
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
  end

  def update_text_2
    @concert = Concert.find(params[:id])
    @concert.text2 = current_user.id
    @concert.save
    ConcertMailer.assign(@concert).deliver_later
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
  end

  def destroy_text_2
    @concert = Concert.find(params[:id])
    @concert.text2 = nil
    @concert.save
    ConcertMailer.assign(@concert).deliver_later
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
  end

  def update_interview
    @concert = Concert.find(params[:id])
    @concert.interview = current_user.id
    @concert.save
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
    ConcertMailer.assign(@concert).deliver_later
  end

  def destroy_interview
    @concert = Concert.find(params[:id])
    @concert.interview = nil
    @concert.save
    respond_to do |format|
      format.js { render action: 'index', status: :created, location: @concert }
    end
    ConcertMailer.assign(@concert).deliver_later
  end

  def destroy
    @concert = concert.find(params[:id]).destroy
    flash[:notice] = 'concert successfuly deleted'
    redirect_to countries_path
  end

  private

  def concert_params
    params.require(:concert).permit(:venue_id, :on_date, :status_id, :user_id, :photo1, :photo2, :text1, :text2, :interview,
                                    concert_lists_attributes: [:id, :concert_id, :band_id, :_destroy])
  end

  def filtering_params(params)
    params.slice(:sorted, :status)
  end
end
