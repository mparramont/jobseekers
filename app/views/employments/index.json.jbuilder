json.array!(@employments) do |employment|
  json.extract! employment, :id, :title, :description, :key_skills, :date, :user_id
  json.url employment_url(employment, format: :json)
end
