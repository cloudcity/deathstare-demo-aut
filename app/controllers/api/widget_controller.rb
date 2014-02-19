class Api::WidgetController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    widget = Widget.new(title: params[:title], description: params[:description])
    widget.save
    render json: widget, status: 201
  end

  def index
    widgets_list = Widget.all
    widgets_hash = widgets_list.index_by(&:id)
    render json: widgets_hash, status: 200
  end

  def destroy
    widget = Widget.find_by_id(params[:id])
    if widget
      widget.destroy
      render json: {messages: ['Widget destroyed']}, status: 200
    else
      render json: {messages: ['No such widget']}, status: 400
    end
  end
end
