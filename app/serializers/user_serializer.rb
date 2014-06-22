class UserSerializer < ActiveModel::Serializer
  attributes :id.to_s, :email
  has_many :contracts
  embed :ids, include: true

  


end
