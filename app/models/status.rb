# == Schema Information
#
# Table name: statuses
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  color       :string           default("#fff")
#

class Status < ActiveRecord::Base
	has_many :concerts

	validates :name, presence: true
	validates :color, presence: true
end
