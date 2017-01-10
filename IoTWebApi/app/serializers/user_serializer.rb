class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :email, :api_key, :token_count
  #has_one :role
  belongs_to :role
end
