json.broadcasts @broadcasts do |b|
    json.(b, :id, :session_name)
end