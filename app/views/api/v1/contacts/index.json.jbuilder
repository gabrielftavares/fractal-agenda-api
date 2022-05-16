json.array! @contacts do |contact|
  json.extract! contact, :id, :name, :email, :city, :state, :country, :phone_number, :relation
end
