class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create

    # Do whatever your app needs to do to create a User

      serializer = { messages: ['User successfully registered'] }
      render json: api_response(serializer), status: 201
  end
end

