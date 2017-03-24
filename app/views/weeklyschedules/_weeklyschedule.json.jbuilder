json.extract! weeklyschedule, :id, :lessonhours_id, :day_id, :curriculum_id, :classroom_id, :created_at, :updated_at
json.url weeklyschedule_url(weeklyschedule, format: :json)