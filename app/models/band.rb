# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Band < ActiveRecord::Base
	has_many :concert_lists
	has_many :concerts, through: :concert_lists
	belongs_to :country

	validates :name, presence: true
	validates :country_id, presence: true
end
