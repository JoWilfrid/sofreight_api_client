module SofreightApi::Requesters
  class Base

    attr_accessor :connection

    def initialize
      @connection = Faraday.new(url: self.class.api_url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
      	faraday.headers['Content-type'] 	= 'application/json'
      	faraday.headers['Accept'] 				= 'application/json'
      	faraday.headers['Accept-Charset'] = 'utf-8'
        faraday.adapter  :em_http  # make requests with Net::HTTP
      end
    end

    class << self

      attr_accessor :api_protocol, :api_host, :api_port

      @@api_protocol = :http
      @@api_host = :localhost
      @@api_port = 3000

      def api_url
        port  = self.api_port || 80
        url   = 'http://localhost:3000' #"#{self.api_protocol.to_s}://#{self.api_host.to_s}:#{port.to_i}"
        # raise "Invalid URL: #{url}." if self.api_protocol.nil? || self.api_host.nil?
      end

      def configure
        yield self
      end

    end

  end
end
