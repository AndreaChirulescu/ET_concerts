# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Venue < ActiveRecord::Base
	has_many :concerts
	belongs_to :country
end
