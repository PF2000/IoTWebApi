class SchoolClassSerializer < ActiveModel::Serializer
  attributes :id, :description, :start_time, :end_time, :class_letter, :class_type, :professor
  has_one :discipline
  has_one :room
  has_one :school_year
end
