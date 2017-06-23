module SofreightApi::Models::OpenFreight::Response
  class LocalFee

    include ActiveModel::Model

    attr_accessor :charge_code, :charge_cname,
                  :unit, :price, :currency, :remark,
                  :c_20gp, :c_40gp, :c_40hc, :c_45hc

    def initialize(*args)
      attrs = args.first
      new_attrs = attrs.dup
      attrs.each do |name, value|
        if name.match(/^[0-9]/)
          new_attrs["c_#{name}".to_sym] = value
          new_attrs.delete(name)
        end
      end
      args[0] = new_attrs
      super(*args)
    end
  end
end
