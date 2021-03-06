if @resource==nil
  json.set! :error, '新增记录出错'
else
  json.extract! @resource, :id, :user_id, :suffer_id, :resource_type, :resource_size, :resource_category, :updated_at, :resource_description
  if @resource.resource_url.url == nil
    json.set! :resource_url, @resource.resource_url.url
  else
    json.set! :resource_url, IP+@resource.resource_url.url
  end

  if @resource.resource_thumbnailUrl.url == nil
    json.set! :resource_thumbnailUrl, @resource.resource_thumbnailUrl.url
  else
    json.set! :resource_thumbnailUrl, IP+@resource.resource_thumbnailUrl.url
  end

  patient = Patient.find(@resource.suffer_id)
  json.set! :patient_name, patient.patient_name
  if patient.patient_url.url == nil
    json.set! :patient_url, patient.patient_url.url
  else
    json.set! :patient_url, IP+patient.patient_url.url
  end

end