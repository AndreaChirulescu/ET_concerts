class MyConcertDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegator :@view, :html_safe
  def_delegator :@view, :content_tag
  def_delegator :@view, :link_to

  def sortable_columns
    @sortable_columns ||= [
      'Concert.id',
      'Venue.name',
      'Concert.on_date',
      'Concert.photo1',
      'Concert.photo2',
      'Concert.text1',
      'Concert.text2',
      'Concert.status_id']
  end

  def searchable_columns
    @searchable_columns ||= [
      'Concert.id',
      'Venue.name',
      'Band.name']
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.venue.name,
        record.on_date,
        photo_1_link(record),
        photo_2_link(record),
        text_1_link(record),
        text_2_link(record),
        interview_link(record),
        bands(record),
        status_badge(record),
        edit_link(record),
        destroy_link(record),
        record.venue.city
      ]
    end
  end

  def get_raw_records
    Concert.joins(:venue).includes(:concert_lists).includes(:bands).references(:band).sorted.
    where("? in (text1, text2, photo1, photo2, interview)", v.current_user.id).paginate(per_page: 10, page: params[:page])
  end

  def v
    @view
  end

  def photo_1_link(concert)
    if concert.photo1.nil?
      #if current user has already signed for photo2 text1 or text2 he can't sign to this
      if [concert.photo2, concert.text1, concert.text2].include? v.current_user.id
        content_tag(:i, nil, class: "fa fa-times fa-2x")
      #else he can
      else
        link_to v.update_photo_1_path(concert.id), remote: true do
          content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:green")
        end
      end
    elsif concert.photo1 == v.current_user.id
        link_to v.destroy_photo_1_path(concert.id), remote: true do
        content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:red", data: {content: "#{User.find(concert.photo1).email}" })
        end
    else
      content_tag(:i, nil, class: "icon fa fa-user fa-2x", data: {content: "#{User.find(concert.photo1).email}"})
    end
  end

  def photo_2_link(concert)
    if concert.photo2.nil?
      #if current user has already signed for photo1 text1 or text2 he can't sign to this
      if [concert.photo1, concert.text1, concert.text2].include? v.current_user.id
        content_tag(:i, nil, class: "fa fa-times fa-2x")
      #else he can
      else
        link_to v.update_photo_2_path(concert.id), remote: true do
          content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:green")
        end
      end
    elsif concert.photo2 == v.current_user.id
      link_to v.destroy_photo_2_path(concert.id), remote: true do
        content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:red", data:{content: "#{User.find(concert.photo2).email}"})
      end
    else
      content_tag(:i, nil, class: "icon fa fa-user fa-2x", data: {content: "#{User.find(concert.photo2).email}"})
    end
  end

  def text_1_link(concert)
    if concert.text1.nil?
      #if current user has already signed for photo1 photo2 or text2 he can't sign to this
      if [concert.photo1, concert.photo2, concert.text2].include? v.current_user.id
        content_tag(:i, nil, class: "fa fa-times fa-2x")
      #else he can
      else
        link_to v.update_text_1_path(concert.id), remote: true do
          content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:green")
        end
      end
    elsif concert.text1 == v.current_user.id
      link_to v.destroy_text_1_path(concert.id), remote: true do
        content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:red;", data:{content: "#{User.find(concert.text1).email}"})
      end
    else
      content_tag(:i, nil, class: "icon fa fa-user fa-2x", data:{content: "#{User.find(concert.text1).email}"})
    end
  end

  def text_2_link(concert)
    if concert.text2.nil?
      #if current user has already signed for photo1 photo2 or text1 he can't sign to this
      if [concert.photo1, concert.photo2, concert.text1].include? v.current_user.id
        content_tag(:i, nil, class: "fa fa-times fa-2x")
      #else he can
      else
        link_to v.update_text_2_path(concert.id), remote: true do
          content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:green;")
        end
      end
    elsif concert.text2 == v.current_user.id
      link_to v.destroy_text_2_path(concert.id), remote: true do
        content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:red;", data:{content: "#{User.find(concert.text2).email}"})
      end
    else
      content_tag(:i, nil, class:"icon fa fa-user fa-2x", data:{content: "#{User.find(concert.text2).email}"})
    end
  end

  def interview_link(concert)
    if concert.interview.nil?
      link_to v.update_interview_path(concert.id), remote: true do
        content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:green;")
      end
    elsif concert.interview == v.current_user.id
      link_to v.destroy_interview_path(concert.id), remote: true do
        content_tag(:i, nil, class: "icon fa fa-user fa-2x", style: "color:red;", data: {content: "User.find(concert.interview).email"})
      end
    else
      content_tag(:i, nil, class: "icon fa fa-user fa-2x", data:{content: "#{User.find(concert.interview).email}"})
    end
  end

  def bands(concert)
    @bands = ""
    concert.bands.map(&:name).join(', ')
      #@bands += "#{b.name} #{',' unless concert.bands.last}"
    #end
    #return @bands
  end

  def status_badge(concert)
    content_tag(:span, concert.status.name, class: "status badge", style: "background: #{concert.status.color}")
  end

  def edit_link(concert)
      link_to v.edit_concert_path(concert.id), remote: true, class: "btn btn-sm btn-warning" do
        content_tag(:i, " Edit", class: "fa fa-pencil-square-o")
      end
  end

  def destroy_link(concert)
    if v.current_user.admin?
      link_to v.concert_path(concert.id), method: :delete, class: "btn btn-sm btn-danger", remote: true do
        content_tag(:i, " Delete", class: "fa fa-trash-o")
      end
    end
  end

end
