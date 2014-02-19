class Api::ClientDevicesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    client_device = ClientDevice.new(id: params[:client_device_id])
    if client_device.save
      serializer = {messages: ['Client Device successfully registered']}
      render json: api_response(serializer), status: 201
    else
      serializer = {messages: ['Client Device could not be registered']}
      render json: api_response(serializer), status: 403
    end
  end

end
