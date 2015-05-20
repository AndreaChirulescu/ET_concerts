class StatusesController < ApplicationController
	def index
	  @statuses = Status.all
	end

	private
	def status_params
	  params.require(:status).permit(:name, :description, :color)
	end
end