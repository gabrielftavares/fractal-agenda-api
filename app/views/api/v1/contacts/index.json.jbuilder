json.array! @contacts do |contact|
  json.extract! contact, :id, :name, :email, :phone_number
end
