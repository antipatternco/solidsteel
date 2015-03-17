class MixSerializer < ActiveModel::Serializer
  attributes :id, :name, :part, :soundcloudId, :image
  has_many :tracks
end