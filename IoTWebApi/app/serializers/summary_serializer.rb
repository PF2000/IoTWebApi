class SummarySerializer < ActiveModel::Serializer
  attributes :id, :number_students, :description, :date
  has_one :school_class
end
