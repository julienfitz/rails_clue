class ClueQueriesController < ApplicationController
  def index
    if !params[:query_string]
      render json: {}, status: 200
    else
      @query_response = process_query(params[:query_string])
      render json: { query_as_sql: @query_response.to_sql, original_query_string: params[:query_string], query_response: @query_response }, status: 200
    end
  end

  private

  def process_query(query_string)
    eval(query_string)
  end
end