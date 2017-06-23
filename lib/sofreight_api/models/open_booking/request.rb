module SofreightApi::Models::OpenBooking
  class Request
    include ActiveModel::Model
    extend Enumerize

    # Constants
    BL_TYPE_MBL = 'MBL'
    BL_TYPE_HBL = 'HBL'

    PAYMENT_FREIGHT_PREPAID = 'FREIGHT PREPAID'
    PAYMENT_FREIGHT_TO_PAY  = 'FREIGHT COLLECT'

    TERMS_CY_CY     = 1
    TERMS_CY_DOOR   = 4
    TERMS_DOOR_CY   = 7
    TERMS_DOOR_DOOR = 8

    TS_TYPE_INLAND_WATER_TRANSIT    = 0
    TS_TYPE_INTERNATIONAL_TRANSFER  = 1

    CARGO_PROPERTY_DANGEROUS_GOOD             = 'DANGEROUS GOODS'
    CARGO_PROPERTY_GENERAL_CARGO              = 'GENERAL CARGO'
    CARGO_PROPERTY_COLD_PRODUCTS              = 'COLD PRODUCTS'
    CARGO_PROPERTY_REFRIGERATE_PRODUCTS       = 'REFRIGERATE PRODUCTS'
    CARGO_PROPERTY_FRESH_PRODUCTS             = 'FRESH PRODUCTS'
    CARGO_PROPERTY_VALUABLE_ITEMS             = 'VALUABLE ITEMS'
    CARGO_PROPERTY_FROZEN_AND_DANGEROUS_CARGO = 'FROZEN AND DANGEROUS CARGO'

    # Attributes
    attr_accessor :freight_id,
                  :mid, :cls, :etd, :bl_type, :payment, :terms, :ctnr,
                  :commodity, :marks, :DO, :SO, :SI,
                  :shipper, :consignee, :notify,
                  :feeder_cls, :feeder_etd,
                  :ts_type, :ready_date, :release_mode, :measurement,
                  :pkgs_nums, :pkgs_type, :hs_code, :cargo_property,
                  :is_afr, :is_ams, :is_isf, :is_customs, :is_truck,
                  :truck_man, :truck_date, :truck_address,
                  :remark, :service_code, :customer_no,
                  :authorKey


      # Behaviors
      enumerize :bl_type, in: [ BL_TYPE_MBL, BL_TYPE_HBL ]
      enumerize :payment, in: [ PAYMENT_FREIGHT_PREPAID, PAYMENT_FREIGHT_TO_PAY ]
      enumerize :terms, in: [ TERMS_CY_CY, TERMS_CY_DOOR, TERMS_DOOR_CY, TERMS_DOOR_DOOR ]
      enumerize :ts_type, in: [ TS_TYPE_INLAND_WATER_TRANSIT, TS_TYPE_INTERNATIONAL_TRANSFER ]
      enumerize :cargo_property, in: [
        CARGO_PROPERTY_DANGEROUS_GOOD,
        CARGO_PROPERTY_GENERAL_CARGO,
        CARGO_PROPERTY_COLD_PRODUCTS,
        CARGO_PROPERTY_REFRIGERATE_PRODUCTS,
        CARGO_PROPERTY_FRESH_PRODUCTS,
        CARGO_PROPERTY_VALUABLE_ITEMS,
        CARGO_PROPERTY_FROZEN_AND_DANGEROUS_CARGO
      ]


      # Validations
      validates_presence_of :freight_id
      validates_presence_of :mid
      validates_presence_of :cls
      validates_presence_of :etd
      validates_presence_of :bl_type
      validates_presence_of :payment
      validates_presence_of :terms
      validates_presence_of :ctnr
      validates_presence_of :commodity
      validates_presence_of :DO
      validates_presence_of :feeder_cls
      validates_presence_of :feeder_etd
      validates_presence_of :authorKey
  end
end
