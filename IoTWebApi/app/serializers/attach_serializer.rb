class AttachSerializer < ActiveModel::Serializer
  attributes :id, :name, :data, :type, :description, :date
  has_one :project
end
