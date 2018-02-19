Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, types.ID
  field :email, types.String
  field :first_name, types.String
  field :last_name, types.String
  field :posts, types[Types::PostType] do
    preload :posts
  end
  field :posts_count, types.Int
  field :created_at, Types::DateTimeType
  field :updated_at, Types::DateTimeType
end
