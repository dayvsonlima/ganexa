require_relative 'params'

module Request
  class Handler
    def initialize(request, params)
      @request = request
      @params  = params
    end

    def run
      params
    end

    private
      def params
        @params ||= Params.new(@request.query_string, params)
      end
  end
end
