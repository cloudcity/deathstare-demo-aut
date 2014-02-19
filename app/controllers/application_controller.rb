class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def api_request
    puts "api_request #{params}"
    prms = params.dup
    %w(controller action).each {|prm| prms.delete(prm)}

    # see first if request uri exists, as it seems that in error handling it is the one that gets populated
    # with the original route, whereas path info holds the new route (error controller), but request uri is
    # not always present, hence the fallback
    path = request.env['REQUEST_URI'] || request.env['PATH_INFO']
    { host: request.env['HTTP_HOST'], path: path, method: request.env['REQUEST_METHOD'], params: prms }
  end

  # this method can take an ActiveModelSerializer, or just a regular hash!
  # an array serializer can be passed in but must always be assigned to a root node:
  # ie: should be { root_element => array_serializer } passed in, not just an ArraySerializer
  def api_response(serializer)
    # note: for array serializers, the following code will not fail as long as it is assigned to a root,
    # ie: should be { root_element => array_serializer }
    puts "API_RESPONSE #{serializer}"
    { request: api_request, response: serializer.merge({error: false})}
  end

end
