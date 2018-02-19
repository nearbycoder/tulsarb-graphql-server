Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  field :id, types.ID
  field :title, types.String
  field :votes, types.Int
  field :user, Types::UserType do
    preload :user
  end
  field :created_at, Types::DateTimeType
  field :updated_at, Types::DateTimeType
end
