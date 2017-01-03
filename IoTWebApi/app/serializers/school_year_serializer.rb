class SchoolYearSerializer < ActiveModel::Serializer
  attributes :id, :description, :startTime, :endTime
end
