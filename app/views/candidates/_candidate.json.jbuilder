# frozen_string_literal: true

json.extract! candidate, :id, :first_name, :last_name, :bio, :professional, :why, :user_id, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
