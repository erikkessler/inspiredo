class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :contracts
  embed :ids, include: true

  


end
