require 'sinatra/base'
require 'mimemagic'
require_relative 'request/handler'

module Ganexa
  class Server < Sinatra::Base
    %i(get post).each do |method|
      send method, '/*' do
        Request::Handler.new(request, params)

        get_params = request.query_string.split('&')

        $_GET = get_params.map { |param| param.split('=') }
               .map { |param| [param[0], param[1] ] }

        $_GET ||= []

        $_GET = $_GET.to_h

        if request.request_method == 'POST'
          $_POST = params
        end

        extension = File.extname(request.path_info)

        template_path = "#{Dir.pwd}#{request.path_info}"

        mimetype = MimeMagic.by_path template_path

        if mimetype
          send_file open(template_path),
            type: mimetype,
            disposition: 'inline'
        else
          begin
            file = File.open(template_path)
          rescue
            return 'file not found'
          end

          content = file.read
          template = ERB.new(content)
          template.result
        end
      end
    end
  end
end
