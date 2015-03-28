class BroadcastSerializer < ActiveModel::Serializer
  attributes :id, :session_name, :broadcast_date, :altnotes, :image, :highlight
  has_many :mixes
end
