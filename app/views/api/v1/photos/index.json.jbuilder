json.data do
  json.array! @photos do |photo|
    json.patrial! "photo", photo: photo
  end
end