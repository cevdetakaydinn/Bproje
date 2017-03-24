json.extract! curriculum, :id, :departmentlessons_id, :academicterm_id, :instructor_id, :created_at, :updated_at
json.url curriculum_url(curriculum, format: :json)