class StudentContractsSerializer < ActiveModel::Serializer
  has_many :contracts
  embed :ids, include: true
end
