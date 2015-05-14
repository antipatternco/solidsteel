class SimpleMixSerializer < ActiveModel::Serializer
  attributes :id, :name, :part, :soundcloudId, :background_image, :mix_image, :secret, :permalink, :downloadlink, :playbackcount
end