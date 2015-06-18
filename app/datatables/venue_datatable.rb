class VenueDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :link_to
  def_delegator :@view, :content_tag

  def sortable_columns
    @sortable_columns ||= ['venues.name']
  end

  def searchable_columns
    @searchable_columns ||= ['venues.name']
  end

  private
  def data
    records.map do |record|
      [
        record.id,
        record.name,
        record.country_id,
        link_to(v.edit_venue_path(record.id), remote: true, class: "btn btn-md btn-warning") do
          content_tag(:i, ' Edit', class: 'fa fa-pencil-square-o')
        end,
        link_to(v.venue_path(record.id), method: :delete, remote: true, class: "btn btn-md btn-danger") do
          content_tag(:i, ' Delete', class: 'fa fa-trash-o')
        end
      ]
    end
  end

  def get_raw_records
    Venue.includes(:country).paginate(per_page: 10, page: params[:page])
  end

  def v
    @view
  end
end
