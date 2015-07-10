class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    respond_to do |format|
			format.html
			format.js
			format.json{ render json: UserDatatable.new(view_context) }
		end
  end

  def update
    @user = User.find(params[:id])
    @user.admin = true
    @user.save

    respond_to do |format|
      format.js
    end
  end
end
