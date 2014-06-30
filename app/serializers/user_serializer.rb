class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :contracts
  has_many :feed_items
  embed :ids, include: true

  


end
