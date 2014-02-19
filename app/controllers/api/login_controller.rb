class Api::LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    # Do whatever your app does to log in a user
    serializer = {messages: ['User now logged in']}
    render json: api_response(serializer), status: 201
  end
end