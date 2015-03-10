class MixSerializer < ActiveModel::Serializer
  attributes :id, :name, :part, :url, :image
  has_many :tracks
end