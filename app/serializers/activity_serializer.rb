class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :count, :value, :days_active, :complete_today

end
