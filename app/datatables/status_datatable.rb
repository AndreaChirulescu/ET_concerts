class StatusDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :link_to
  def_delegator :@view, :content_tag

  def sortable_columns
    @sortable_columns ||= '[status.name]'
  end

  def searchable_columns
    @searchable_columns ||= '[status.name]'
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.name,
        record.color,
        link_to(edit_status_path(record.id), remote: true, class: "btn btn-md btn-warning") do
          content_tag(:i, 'Edit', class: 'fa fa-pencil-square-o')
        end,
        link_to(status_path(record.id), method: :delete, remote: true, class: "btn btn-md btn-danger") do
          content_tag(:i, 'Delete', class: 'fa fa-trash-o')
        end
      ]
    end
  end

  def get_raw_records
    Status.all.paginate(per_page: 10, page: params[:page])
  end

  def v
    @view
  end

end
