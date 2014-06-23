class ContractSerializer < ActiveModel::Serializer
  attributes :id, :name, :reward
  has_one :user
  embed :ids

  has_many :activities
  embed :ids, include: true


end
