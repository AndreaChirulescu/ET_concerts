class UserDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :link_to

  def sortable_columns
    @sortable_columns = ['users.email', 'users.admin']
  end

  def searchable_columns
    @searchable_columns = ['users.email']
  end

  private

  def data
    records.map do |record|
    [
      record.id,
      record.email,
      record.admin
    ]
    end
  end

  def get_raw_records
    User.where("id != ?", v.current_user.id).paginate(per_page: 10, page: params[:page])
  end

  def v
    @view
  end
end
