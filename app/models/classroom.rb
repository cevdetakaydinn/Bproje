class Classroom < ActiveRecord::Base
  belongs_to :facility
  has_many :weeklylschedules
end
