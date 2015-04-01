class SimpleBroadcastSerializer < ActiveModel::Serializer
  attributes :id, :session_name, :broadcast_date, :image, :background_image, :highlight
end
