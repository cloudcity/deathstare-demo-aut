require 'spec_helper'

describe Api::ClientDevicesController do

  describe "POST 'create'" do

    let(:client_device_id) {'272'}
    let(:parsed_response) { JSON.parse(response.body) }
    let(:post_request) {post :create, { client_device_id: client_device_id } }

    describe 'success' do
      it 'returns 201' do
        post_request
        response.status.should == 201
      end

      it 'assigns expected param' do
        client_device = mock_model(ClientDevice)
        ClientDevice.should_receive(:new).with({id: client_device_id}).and_return(client_device)
        client_device.stub(:save).and_return(true)

        post_request
      end

      it 'creates new client_device record' do
        expect {post_request}.to change{ClientDevice.count}.by(1)
      end

      it 'returns success message' do
        post_request

        parsed_response['response']['messages'].should include('Client Device successfully registered')
      end

    end

    describe 'failure' do

      it 'returns 403' do
        post :create

        response.status.should == 403
      end

      describe 'client id already exists' do
        before(:each) do
          ClientDevice.create(id: client_device_id)
        end

        it 'should not create record' do
          expect {post_request}.to_not change{ClientDevice.count}
        end

        it 'returns failure message' do
          post_request

          parsed_response['response']['messages'].should include('Client Device could not be registered')
        end
      end

    end

  end

end
