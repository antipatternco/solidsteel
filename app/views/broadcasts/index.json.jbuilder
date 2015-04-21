json.broadcasts @broadcasts do |b|
  json.id b.id
  json.session_name b.session_name
  json.broadcast_date b.broadcast_date
  json.mixes b.mixes
end