require 'spec_helper'

describe Api::WidgetController do

  describe "POST 'create'" do

    describe 'success' do

      let!(:initial_widget_count) { Widget.count }
      let!(:post_request) { post :create, {title: 'My Widget', description: 'Hey, it is a widget'} }

      it 'creates new widget record' do
        expect(Widget.count).to eq(initial_widget_count + 1)
      end

    end
  end

  describe "GET 'index'" do

    describe "success" do

      it 'returns 200' do
        get "index"
        response.status.should == 200
      end

      it 'returns all widgets' do
        Widget.create({title: 'RUMPLESTILTSKIN', description: 'Number 1'})
        Widget.create({title: 'ABRACADABRA', description: 'Number 2'})
        get :index

        parsed_response = JSON.parse(response.body)
        expect(parsed_response.count).to eq(2)
      end

    end

  end

  describe 'DELETE' do

    it 'deletes an existing Widget' do
      widget = Widget.create({title: 'Tres', description: 'Number 3'})
      delete :destroy, {:id => widget.id}
      response.status.should == 200
      parsed_response = JSON.parse(response.body)
      parsed_response['messages'].should include("Widget destroyed")

    end

    it 'handles a bad id with grace' do
      delete :destroy, {:id => -42}
      parsed_response = JSON.parse(response.body)
      response.status.should == 400
      parsed_response['messages'].should include("No such widget")
    end

  end

end