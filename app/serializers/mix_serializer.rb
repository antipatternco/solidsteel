class MixSerializer < ActiveModel::Serializer
  attributes :id, :name, :part
  has_many :tracks
end