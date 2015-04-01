class BroadcastSerializer < ActiveModel::Serializer
  attributes :id, :session_name, :broadcast_date, :altnotes, :image, :background_image, :highlight
  has_many :mixes
end
