class MixSerializer < ActiveModel::Serializer
  attributes :id, :name, :part, :soundcloudId, :background_image, :mix_image, :secret, :permalink, :downloadlink, :playbackcount
  has_many :tracks
end