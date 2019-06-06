class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :global_admin, :timezone, :receive_marketing, :external_identifier
  has_many :skills
end
