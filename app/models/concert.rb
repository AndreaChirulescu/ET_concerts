# == Schema Information
#
# Table name: concerts
#
#  id             :integer          not null, primary key
#  venue_id       :integer
#  on_date        :date
#  text1          :text
#  text2          :text
#  interview      :text
#  text_status_id :integer
#  status_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  photo1         :integer
#  photo2         :integer
#  user_id        :integer
#

class Concert < ActiveRecord::Base
  has_many :concert_lists
  has_many :bands, :through => :concert_lists
  belongs_to :venue
  belongs_to :status

  #accepts_nested_attributes_for :bands, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true

  scope :sorted, -> { where("on_date >= ?", Date.today).order(on_date: "desc") }

  validates :venue_id, :presence => true
  validates :on_date, :presence => true
  validates :status_id, :presence => true
end
