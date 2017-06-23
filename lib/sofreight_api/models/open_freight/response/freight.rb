module SofreightApi::Models::OpenFreight::Response
  class Freight

    include ActiveModel::Model

    attr_accessor :freight_id,
                  :area_code, :area_seq, :sub_area_code, :sub_area_seq,
                  :feeder_pol_seq, :feeder_pol_code, :feeder_pol_name,
                  :pol_seq, :pol_code, :pol_name,
                  :pod_seq, :pod_code, :pod_name,
                  :via_name,
                  :carrier_seq, :carrier_code, :carrier_name,
                  :service_code, :cls, :etd, :tt,
                  :begin_date, :end_date,
                  :local_charge, :local_charge_list,
                  :web_remark, :product_id, :freight_type,
                  :c_20gp, :c_40gp, :c_40hc, :c_45hc, :c_20nor, :c_40nor

      def initialize(*args)
        attrs = args.first
        new_attrs = attrs.dup
        attrs.each do |name, value|
          begin
            if name.match(/^[0-9]/)
              new_attrs["c_#{name}".to_sym] = value
              new_attrs.delete(name)
            end
          rescue => e
            puts name.inspect
            puts value.inspect
            raise e
          end
        end
        args[0] = new_attrs
        super(*args)
        local_charge_list.map! { |lcl| lcl = LocalFee.new(lcl) }
      end
  end
end
