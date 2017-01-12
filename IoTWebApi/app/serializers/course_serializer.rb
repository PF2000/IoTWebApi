class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :school, :degree
  #to show the details !!

  belongs_to :school
  has_one :degree
  has_many :disciplines
  has_many :school_years

end
