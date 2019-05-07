class Hello < ApplicationRecord

  def birthday_message
    days_left = days_to_birthday

    if days_left == 0
      "Hello, #{username.capitalize}! Happy birthday!"
    else
      "Hello, #{username.capitalize}! Your birthday is in #{days_left} day(s)"
    end
  end


  private


  def days_to_birthday
    today = Date.today

    # Calculate next birthday
    birthday = Date.new(
      today.year,
      dateOfBirth.month,
      dateOfBirth.day
    )

    birthday += 1.year if birthday < today

    (birthday - today).to_i
  end

end
