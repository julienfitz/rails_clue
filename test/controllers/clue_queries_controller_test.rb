require 'test_helper'

class ClueQueriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Character.create!(name: 'Tim Curry')
  end

  test 'returns a success status and empty response body without params' do
    get '/clue_queries'
    assert_response :success
    assert_equal(json_response, {})
  end

  test 'accepts correctly-formatted parameters with a successful response' do
    get '/clue_queries', params: { query_string: "Character.where(name: 'Tim Curry')" }

    assert_response :success
    assert_equal(JSON.parse(Character.where(name: 'Tim Curry').to_json), json_response['query_response'])
  end  
end