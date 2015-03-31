json.array!(@educations) do |education|
  json.extract! education, :id, :name, :date, :institution, :grade, :description, :user_id
  json.url education_url(education, format: :json)
end
