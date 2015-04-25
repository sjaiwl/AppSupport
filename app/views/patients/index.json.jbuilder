json.array!(@patients) do |patient|
  json.extract! patient, :id, :user_id, :patient_hospitalNumber, :patient_name, :patient_gender, :patient_age, :patient_height, :patient_weight, :patient_telephone, :patient_idNumber, :patient_residence, :patient_situation, :patient_url
  json.url patient_url(patient, format: :json)
end
