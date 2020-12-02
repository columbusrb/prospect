json.extract! candidate, :id, :first_name, :last_name, :bio, :professional, :picture, :why, :user_id, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
