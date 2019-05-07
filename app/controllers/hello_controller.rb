class HelloController < ApplicationController

  def show
    hello = Hello.find_by_username! params[:username]

    render status: :ok, json: { 'message': hello.birthday_message }
  end


  def update
    hello = Hello.find_or_initialize_by username: params[:username].to_s.downcase

    hello.dateOfBirth = params[:dateOfBirth]
    hello.save!

    render status: :no_content
  end

end
