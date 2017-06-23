module SofreightApi::Requesters
  class OpenFreight < Base

    def getList(attrs)
      path    = '/OpenFreight/getList'
      data    = SofreightApi::Models::OpenFreight::Request.new(attrs)
      params  = data.instance_variables.reject { |k| k === :@errors }.map do |k|
        { k.to_s.gsub('@', '') => data.instance_variable_get(k) }
      end.reduce({}) { |base, current| base[current.keys.first.to_sym] = current.values.first; base }

      if data.valid?
        body    = send_request(path, params).body
        body    = JSON.parse(body)
        success = body['Status'].to_i === 1
        if success
          body    = body['Message'].map { |freight| SofreightApi::Models::OpenFreight::Response::Freight.new(freight) }
          errors  = nil
        else
          raise SofreightApi::Errors::CODES[body['errorCode']].new(body['errorCode'])
        end
      else
        success = false
        body    = nil
        errors  = data.errors.messages
      end

      { success: success, data: body, errors: errors }
    end


    private

      def send_request(path, params)
        connection.get do |request|
          request.url path
          request.params = params
          request.params[:error] = true
        end
      end

  end
end
