RailsDemoSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)
  instrument(:field, FieldNameCamelizer.new)
  instrument(:argument, FieldNameCamelizer.new)
  use GraphQL::Batch
  enable_preloading
end

# RailsDemoSchema.middleware

GraphQL::Errors.configure(RailsDemoSchema) do
  rescue_from ActiveRecord::RecordNotFound do |exception|
    nil
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    GraphQL::ExecutionError.new(exception.record.errors.full_messages.join("\n"))
  end

  rescue_from StandardError do |exception|
    GraphQL::ExecutionError.new("Please try to execute the query for this field later")
  end
end