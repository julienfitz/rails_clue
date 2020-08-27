class ClueQueriesController < ApplicationController

  def index
    @query_response = process_query(params[:query_string])

    render jsonapi: @query_response, status: 200
  end

  private

  def process_query(query_string)
    return nil if !query_string.instance_of? String

    eval(query_string)
  end
end