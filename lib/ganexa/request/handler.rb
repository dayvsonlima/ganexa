module Request
  class Handler
    def initialize(request, request_params, server)
      @server         = server
      @request        = request
      @request_params = request_params
    end

    def run
      render = Request::Render.new(@request, params, @server)
      render.run
    end

    private
      def params
        @params ||= Request::Params.new(@request.query_string, @request_params)
      end
  end
end
