class BroadcastSerializer < ActiveModel::Serializer
  attributes :id, :session_name, :broadcast_date, :altnotes, :image, :background_image, :highlight, :background_image_thumb_url
  has_many :mixes
end
