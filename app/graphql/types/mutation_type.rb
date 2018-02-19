Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createUser, Types::UserType do
    description 'Create a new user'
    argument :email, !types.String
    argument :first_name, !types.String
    argument :last_name, !types.String

    resolve ->(_obj, args, _ctx) {
      User.create(args.to_h)
    }
  end

  field :updateUser, Types::UserType do
    description 'Update a user'
    argument :id, !types.String
    argument :email, types.String
    argument :first_name, types.String
    argument :last_name, types.String

    resolve ->(_obj, args, _ctx) {
      user = User.find(args[:id])
      user.update(args.to_h)
      user
    }
  end

  field :createPost, Types::PostType do
    description 'Create a new post'
    argument :title, !types.String
    argument :user_id, !types.ID

    resolve ->(_obj, args, _ctx) {
      user = User.find(args[:user_id])
      user.posts.create(args.to_h)
    }
  end

  field :updatePost, Types::PostType do
    description 'Update a post'
    argument :id, !types.String
    argument :title, !types.String

    resolve ->(_obj, args, _ctx) {
      post = Post.find(args[:id])
      post.update(args.to_h)
      post
    }
  end

  field :upvotePost, Types::PostType do
    description 'Upvote a post'
    argument :id, !types.String

    resolve ->(_obj, args, _ctx) {
      post = Post.find(args[:id])
      post.update(votes: post.votes + 1)
      post
    }
  end

  field :downvotePost, Types::PostType do
    description 'Downvote a post'
    argument :id, !types.String

    resolve ->(_obj, args, _ctx) {
      post = Post.find(args[:id])
      post.update(votes: post.votes - 1) if post.votes != 0
      post
    }
  end
end
