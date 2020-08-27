require 'test_helper'

class ClueQueriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_name = 'Tim Curry'
    Character.create!(name: @character_name)
  end

  test 'returns a success status and nil response body without params' do
    get '/clue_queries'
    assert_response :success
    assert_nil json_response['data']
  end

  test 'accepts correctly-formatted parameters with a successful response' do
    get '/clue_queries', params: { query_string: "Character.where(name: '#{@character_name}')" }

    assert_response :success
    assert_equal(json_response['data'].length, 1)
    assert_equal(json_response['data'][0]['attributes']['name'], @character_name)
  end  
end