require 'sinatra/base'

class App < Sinatra::Base
  %i(get post).each do |method|
   send method, '/*' do

    get_params = request.query_string.split('&')

    $_GET = get_params.map{|param| param.split('=') }
    				  .map{|param| [param[0], param[1] ] }

    $_GET ||= []

    $_GET = $_GET.to_h

   	if request.request_method == 'POST'
   	  $_POST = params
   	end

    template_path = "#{Dir.pwd}#{request.path_info}"

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
