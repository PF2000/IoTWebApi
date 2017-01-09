class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :district, :city, :county, :post_code, :address_details
end
