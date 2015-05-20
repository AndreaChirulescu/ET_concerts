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
	has_and_belongs_to_many :concert, through: :bands_concerts
end
