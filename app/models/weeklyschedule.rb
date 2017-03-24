class Weeklyschedule < ActiveRecord::Base
  belongs_to :lessonhours
  belongs_to :day
  belongs_to :curriculum
  belongs_to :classroom
end
