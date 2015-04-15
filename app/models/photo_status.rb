# == Schema Information
#
# Table name: photo_statuses
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PhotoStatus < ActiveRecord::Base
end
