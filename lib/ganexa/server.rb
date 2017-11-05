require 'sinatra/base'
require 'mimemagic'

require_relative 'request/params'
require_relative 'request/render'
require_relative 'request/handler'

module Ganexa
  class Server < Sinatra::Base
    %i(get post).each do |method_name|
      send(method_name, '/*') do
        request_handler = Request::Handler.new(request, params, self)
        request_handler.run
      end
    end
  end
end
