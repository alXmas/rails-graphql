# frozen_string_literal: true

class RailsGraphqlSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Analysis::AST
  use GraphQL::Batch
  use GraphQL::Schema::Timeout, max_seconds: 20
  use GraphQL::Backtrace

  rescue_from(BadParamsError) do |exp|
    raise GraphQL::ExecutionError.new(
      exp.message,
      extensions: {
        code: :bad_params,
        fullMessages: exp.full_message
      }
    )
  end
end
