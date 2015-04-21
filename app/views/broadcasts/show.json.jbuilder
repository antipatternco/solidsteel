json.broadcast do
  json.id @broadcast.id
  json.session_name @broadcast.session_name
  json.broadcast_date @broadcast.broadcast_date
  json.mixes @broadcast.mixes
end