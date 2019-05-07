require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest

  test "it return birthday message" do
    get '/hello/john'

    assert_response :ok
    assert_match /Hello/, @response.body
  end


  test "it creates record" do
    refute Hello.find_by_username 'doe'

    assert_difference ->{ Hello.count } => 1 do
      put '/hello/doe', params: { dateOfBirth: '2019-01-01' }
    end

    doe = Hello.find_by_username 'doe'
    assert doe
    assert_equal '2019-01-01', doe.dateOfBirth

    assert_response :no_content
  end


  test "it updates record" do
    assert Hello.find_by_username 'john'

    assert_no_difference ->{ Hello.count } do
      put '/hello/john', params: { dateOfBirth: '2018-01-01' }
    end

    doe = Hello.find_by_username 'doe'
    assert_equal '2018-01-01', doe.dateOfBirth

    assert_response :no_content
  end

end
