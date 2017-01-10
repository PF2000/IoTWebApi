class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :grade
  has_one :discipline
  has_one :school_year
end
