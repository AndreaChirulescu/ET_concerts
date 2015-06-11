class BandDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :link_to
  def_delegator :@view, :content_tag

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['bands.name']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['bands.name']
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.name,
        record.country.name,
        link_to(v.edit_band_path(record.id), remote: true, class:"btn btn-sm btn-warning") do
          content_tag(:i, "Edit", class:"fa fa-pencil-square-o")
        end
      ]
    end
  end

  def get_raw_records
    Band.includes(:country).paginate(per_page: 10, page: params[:page])
  end

  def v
    @view
  end
end
