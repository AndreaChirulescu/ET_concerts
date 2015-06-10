class BandDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :link_to

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
        if v.current_user.admin?
        link_to("Edit", v.edit_band_path(record.id), remote: true, class:"btn btn-sm btn-warning")
        else
          link_to("Show", v.band_path(record.id), remote: true, class:"btn btn-sm btn-default")
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
