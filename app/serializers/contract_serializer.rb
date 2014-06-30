class ContractSerializer < ActiveModel::Serializer
  attributes :id, :name, :reward, :count, :needed, :state, :days_left, :duration

  has_many :activities
  embed :ids, include: true


end
