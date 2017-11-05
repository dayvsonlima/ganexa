module Request
  class Render
    def initialize(request, params, server)
      @request = request
      @params = params
      @server = server
    end

    def run
      mime_type ? send_file : content_erb
    end

    private

      def request_path
        [Dir.pwd, @request.path_info].join
      end

      def mime_type
        MimeMagic.by_path(request_path)
      end

      def send_file
        @server.send_file(
          open(request_path),
          type: mime_type,
          disposition: 'inline'
        )
      end

      def content_erb
        content = File.read(request_path)
        content = '<% require "' + __dir__ + '/../helpers" %>' + content
        ERB.new(content).result
      end
  end
end
