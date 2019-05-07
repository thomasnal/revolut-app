require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest

  test "it return birthday message" do
    get '/hello/john'

    json = JSON.parse @response.body

    assert_response :ok
    assert_match /Hello/, json["message"]
  end


  test "it creates a new record" do
    refute Hello.find_by_username 'doe'

    assert_difference ->{ Hello.count } => 1 do
      put '/hello/doe', params: { dateOfBirth: '2019-01-01' }, as: :json
    end

    doe = Hello.find_by_username 'doe'
    assert doe
    assert_equal '2019-01-01', doe.dateOfBirth.to_s

    assert_response :no_content
  end


  test "it updates an existing record" do
    assert Hello.find_by_username 'john'

    assert_no_difference ->{ Hello.count } do
      put '/hello/john', params: { dateOfBirth: '2018-01-01' }, as: :json
    end

    john = Hello.find_by_username 'john'
    assert_equal '2018-01-01', john.dateOfBirth.to_s

    assert_response :no_content
  end

end
