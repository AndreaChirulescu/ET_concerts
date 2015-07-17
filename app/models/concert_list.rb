class ConcertList < ActiveRecord::Base
  belongs_to :concert
  belongs_to :band
end
