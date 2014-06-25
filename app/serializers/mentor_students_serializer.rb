class MentorStudentsSerializer < ActiveModel::Serializer
  has_many :students
  embed :ids, include: true

  


end
