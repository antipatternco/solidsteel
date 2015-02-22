class BroadcastSerializer < ActiveModel::Serializer
  attributes :id, :session_name, :broadcast_date, :created_at, :updated_at
end
