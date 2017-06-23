module SofreightApi::Models::OpenFreight
  class Request
    include ActiveModel::Model

    attr_accessor :pol_code, :pod_code,
                  :carrier_code, :mid,
                  :freight_id, :authorKey
    attr_reader   :errors

    validates_presence_of :authorKey
    validates :pol_code, presence: true, unless: :freight_id
    validates :pod_code, presence: true, unless: :freight_id
    validates :freight_id, presence: true, if: :pol_and_pod_code_empty

    def initialize(*args)
      @errors = ActiveModel::Errors.new(self)
      super(*args)
    end


    private

    def pol_and_pod_code_empty
      pol_code.nil? && pod_code.nil?
    end

  end
end
