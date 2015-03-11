# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string
#  alpha2     :string
#  alpha3     :string
#  created_at :datetime
#  updated_at :datetime
#

class Country < ActiveRecord::Base
end
