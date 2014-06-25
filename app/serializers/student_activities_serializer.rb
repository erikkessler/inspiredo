class StudentActivitiesSerializer < ActiveModel::Serializer
  has_many :activities
  embed :ids, include: true
  
end
