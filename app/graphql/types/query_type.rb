Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :users, types[Types::UserType] do
    description 'List all users'
    argument :offset, types.Int
    argument :limit, types.Int
    resolve ->(_obj, args, _ctx) {
      User.offset(args[:offset]).limit(args[:limit])
    }
  end

  field :user, Types::UserType do
    description 'find user by id'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) {
      User.find(args[:id])
    }
  end

  field :posts, types[Types::PostType] do
    description 'List all posts'
    argument :offset, types.Int
    argument :limit, types.Int
    resolve ->(_obj, args, _ctx) {
      Post.offset(args[:offset]).limit(args[:limit])
    }
  end

  field :post, Types::PostType do
    description 'find post by id'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) {
      Post.find(args[:id])
    }
  end
end
