class StatusesController < ApplicationController
	before_filter :authenticate_user!, :get_status, only: [:edit, :show, :update, :destroy]
	#before_action:

	def index
		respond_to do |format|
			format.html
			format.js
			format.json{ render json: StatusDatatable.new(view_context) }
		end
	end

	def new
		@status = Status.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@status = Status.new(status_params)

		respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @status }
        # added:
        format.js   { render action: 'index', status: :created, location: @status }
      else
        format.html { render action: 'new' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @status.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		respond_to do |format|
      if @status.update_attributes(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @status }
        # added:
        format.js   { render action: 'index', status: :created, location: @status }
      else
        format.html { render action: 'edit' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @status.errors, status: :unprocessable_entity }
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
			if @status.destroy
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
	def status_params
	  params.require(:status).permit(:name, :description, :color)
	end

	def get_status
		@status = Status.find(params[:id])
	end
end
