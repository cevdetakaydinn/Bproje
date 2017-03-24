json.extract! instructor, :id, :name, :surname, :id_number, :rank, :email, :password, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)