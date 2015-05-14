class SimpleBroadcastSerializer < ActiveModel::Serializer
  attributes :id, :session_name, :broadcast_date, :image, :altnotes, :background_image, :highlight, :background_image_thumb_url
  has_many :mixes, each_serializer: SimpleMixSerializer
end
