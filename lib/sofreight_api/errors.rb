module SofreightApi::Errors

  class NoAuthorizationCode < StandardError
    def initialize(*args)
      super('The authorization code is empty')
    end
  end

  class AuthorizationCodeError < StandardError
    def initialize(*args)
      super('Authorization code error')
    end
  end

  class IllegalServerIpCall < StandardError
    def initialize(*args)
      super('Illegal server IP call')
    end
  end

  class UnknownSystemError < StandardError
    def initialize(*args)
      super('Unknown error system')
    end
  end

  class UnexistingAddress < StandardError
    def initialize(*args)
      super('The requested address does not exist')
    end
  end

  class ServiceRequestTimeout < StandardError
    def initialize(*args)
      super('Service request timeout')
    end
  end

  class RemoteConnectionRefused < StandardError
    def initialize(*args)
      super('Remote service connection is not opened or refused')
    end
  end

  class DataValueError < StandardError

    MESSAGES = {
      '10001'   => 'If freight_id is empty, pol_code cannot be null',
      '10002'   => 'If freight_id is empty, pod_code cannot be null',
      '10003'   => 'If pol_code or pod_code is empty, freight_id cannot be null',
      '10004'   => 'POL code does not exist',
      '10005'   => 'POD code does not exist',
      '10006'   => 'Carrier code does not exist',
      '10007'   => 'Member (mid) does not exist',
      '10021'   => 'Unknown booking error',
      '10022'   => 'Freight rates and freight id cannot be null',
      '10023'   => 'Members mid cannot be null',
      '10024'   => 'Volume cannot be empty',
      '10025'   => 'Please fill out the booking contact',
      '10026'   => 'Closing date cannot be empty',
      '10027'   => 'Barge closing date cannot be empty',
      '10028'   => 'Barges sailing date cannot be empty',
      '10029'   => 'Name cannot be empty',
      '10030'   => 'Bill of lading cannot be empty',
      '10031'   => 'Payment method cannot be empty',
      '10032'   => 'Shipping terms cannot be empty',
      '10033'   => 'Goods cannot be empty',
      '10034'   => 'Original price has been updated, please search again',
      '10035'   => 'When the bill of lading is "HBL", delivery cannot be set to "SWB"',
      '10036'   => 'Each name must not exceed 35 characters, limited to english and numbers',
      '10037'   => 'Each mark must not exceed 35 characters, limited to english and numbers',
      '10038'   => 'Each shipper must not exceed 35 characters, limited to english and numbers',
      '10039'   => 'Each consignee must not exceed 35 characters, limited to english and numbers',
      '10040'   => 'Each notify must not exceed 35 characters, limited to english and numbers'
    }

    def initialize(*args)
      super(MESSAGES[args.first])
    end
  end

  CODES = {
    'SYS002'  => NoAuthorizationCode,
    'SYS003'  => AuthorizationCodeError,
    'SYS004'  => IllegalServerIpCall,
    'SYS005'  => UnknownSystemError,
    'ESB010'  => UnexistingAddress,
    'ESB011'  => ServiceRequestTimeout,
    'ESB012'  => RemoteConnectionRefused,
    '10001'   => DataValueError,
    '10002'   => DataValueError,
    '10003'   => DataValueError,
    '10004'   => DataValueError,
    '10005'   => DataValueError,
    '10006'   => DataValueError,
    '10007'   => DataValueError,
    '10021'   => DataValueError,
    '10022'   => DataValueError,
    '10023'   => DataValueError,
    '10024'   => DataValueError,
    '10025'   => DataValueError,
    '10026'   => DataValueError,
    '10027'   => DataValueError,
    '10028'   => DataValueError,
    '10029'   => DataValueError,
    '10030'   => DataValueError,
    '10031'   => DataValueError,
    '10032'   => DataValueError,
    '10033'   => DataValueError,
    '10034'   => DataValueError,
    '10035'   => DataValueError,
    '10036'   => DataValueError,
    '10037'   => DataValueError,
    '10038'   => DataValueError,
    '10039'   => DataValueError,
    '10040'   => DataValueError
  }
end
