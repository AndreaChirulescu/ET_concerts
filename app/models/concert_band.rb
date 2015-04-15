# == Schema Information
#
# Table name: concert_bands
#
#  id         :integer          not null, primary key
#  concert_id :integer
#  band_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ConcertBand < ActiveRecord::Base
end
