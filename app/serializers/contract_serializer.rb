class ContractSerializer < ActiveModel::Serializer
  attributes :id, :name, :reward
  has_one :user
  embed :ids

end
