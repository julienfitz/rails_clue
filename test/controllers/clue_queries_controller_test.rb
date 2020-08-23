require 'test_helper'

class ClueQueriesControllerTest < ActionDispatch::IntegrationTest
  test 'returns a success status' do
    get '/clue_queries'
    assert_response :success 
  end
end