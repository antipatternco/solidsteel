class SimpleBroadcastSerializer < ActiveModel::Serializer
  attributes :id, :session_name, :broadcast_date, :image, :altnotes, :background_image, :highlight
end
