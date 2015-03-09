class MixSerializer < ActiveModel::Serializer
  attributes :id, :name, :part, :url
  has_many :tracks
end