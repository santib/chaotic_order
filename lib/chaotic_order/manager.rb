# frozen_string_literal: true

module ChaoticOrder
  class Manager
    attr_reader :arel, :adapter_name

    def initialize(arel, adapter_name)
      @arel = arel
      @adapter_name = adapter_name
    end

    def set_random_order
      return unless set_random_order?

      arel.order(random_for_adapter)
    end

    private

    def set_random_order?
      !order_set? && !distinct_set?
    end

    def order_set?
      arel.orders.present?
    end

    def distinct_set?
      arel.to_sql =~ /^SELECT DISTINCT/i
    end

    def random_for_adapter
      if adapter_name =~ /mysql/i
        "RAND()"
      else
        "RANDOM()"
      end
    end
  end
end
