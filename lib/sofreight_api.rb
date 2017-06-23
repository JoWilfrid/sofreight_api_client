require 'sofreight_api/version'

module SofreightApi

  require 'sofreight_api/errors'

  module Requesters
    require 'faraday'

    require 'sofreight_api/requesters/base'
    require 'sofreight_api/requesters/open_freight'
  end

  module Models
    require 'active_model'
    require 'enumerize'

    module OpenBooking
      require 'sofreight_api/models/open_booking/request'
      require 'sofreight_api/models/open_booking/response'
    end
    module OpenFreight
      require 'sofreight_api/models/open_freight/request'

      module Response
        require 'sofreight_api/models/open_freight/response/freight'
        require 'sofreight_api/models/open_freight/response/local_fee'
      end
    end
  end
end
