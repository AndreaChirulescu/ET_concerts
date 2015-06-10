class ConcertDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :generate_photo1
  def_delegator :@view, :generate_photo2
  def_delegator :@view, :generate_text1
  def_delegator :@view, :generate_text2
  def_delegator :@view, :generate_interview
  def_delegator :@view, :html_safe
  def_delegator :@view, :tag
  def_delegator :@view, :current_user

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['concerts.on_date']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['concerts.on_date']
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.on_date,
        if record.photo1.nil?
          if [record.photo2, record.text1, record.text2].include? :current_user.id
            tag("i", class: ["fa fa-times fa-2x"])
          else
            link_to update_photo_1_path(record.id), remote: true do
              tag("i", class: ["icon fa fa-user fa-2x"], style: ["color: green;"])
            end
          end
        elsif record.photo1 == :current_user.id
            link_to destroy_photo_1_path(concert.id), remote: true do
              tag("i", class:["icon fa fa-user fa-2x"], style: "color:red", data: {content: ["#{User.find(record.photo1).email}"]})
            end
        else
          tag("i", class: ["icon fa fa-user fa-2x"], data: {content: ["#{User.find(concert.photo1).email}"]})
        end,
        #generate_photo1(record).html_safe,
        generate_photo2(record).html_safe,
        generate_text1(record).html_safe,
        generate_text2(record).html_safe,
        generate_interview(record).html_safe,
        record.id,
        record.id,
        record.id

      ]
    end
  end

  def get_raw_records
    #Concert.sorted.includes(:venue, :status).paginate(per_page: 10, page: params[:page])
    Concert.all#includes({venue_id: :venues}).references(:venue_id)#all#paginate(per_page: 10, page: params[:page])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
