class MixSerializer < ActiveModel::Serializer
  attributes :id, :name, :part, :soundcloudId, :background_image, :mix_image, :secret
  has_many :tracks
end