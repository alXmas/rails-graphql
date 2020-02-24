# frozen_string_literal: true

class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    context = {
      request: request
    }

    result = if params[:_json]
               queries = params[:_json].map do |param|
                 {
                   query: param[:query],
                   operation_name: param[:operationName],
                   variables: ensure_hash(param[:variables]),
                   context: context
                 }
               end
               RailsGraphqlSchema.multiplex(queries)
             else
              RailsGraphqlSchema.execute(
                 params[:query],
                 operation_name: params[:operationName],
                 variables: ensure_hash(params[:variables]),
                 context: context
               )
             end

    render json: result, adapter: nil
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  def schema
    render json: RailsGraphqlSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)['data']
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
