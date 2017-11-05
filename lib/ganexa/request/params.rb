module Request
  class Params
    def initialize(request, params)
      @request = request
      @params  = params
    end

    def post
      @request.request_method == 'POST' ? @params : []
    end

    def get
      @request
        .query_string
        .split('&')
        .map { |param| param.split('=') }
        .map { |param| [param[0], param[1] ] }
    end
  end
end
