class Day < ActiveRecord::Base
  has_many :weeklylschedules
  validates :day, presence: true
end
