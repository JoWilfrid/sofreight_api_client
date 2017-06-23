module SofreightApi::Models::OpenBooking
  class Response
    include ActiveModel::Model

    attr_accessor :booking_no, :amount, :changes
  end
end
