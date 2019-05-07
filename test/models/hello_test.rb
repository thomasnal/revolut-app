require 'test_helper'

class HelloTest < ActiveSupport::TestCase

  test "it returns number of days to the birthday" do
    john = hellos :john

    Timecop.travel Date.today.beginning_of_year

    assert_equal 1, john.send(:days_to_birthday)
  end


  test "it returns birthday message when zero days left" do
    james = hellos :james

    Timecop.travel Date.today.beginning_of_year

    assert_equal "Hello, James! Happy birthday!",
      james.birthday_message(0)
  end


  test "it returns message with day to birthday when more than zero days left" do
    john = hellos :john

    Timecop.travel Date.today.beginning_of_year

    assert_equal "Hello, John! Your birthday is in 1 day(s)",
      john.birthday_message(1)
  end

end
