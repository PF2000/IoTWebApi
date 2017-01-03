class SchoolClassSerializer < ActiveModel::Serializer
  attributes :id, :description, :startTime, :endTime, :classLetter, :classType, :professor
  has_one :discipline
  has_one :room
end
