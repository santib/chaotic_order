# frozen_string_literal: true

require "rails"
require_relative "chaotic_order/version"
require_relative "chaotic_order/random"

module ChaoticOrder
  class Error < StandardError; end

  class Railtie < Rails::Railtie
    config.to_prepare do
      ::ActiveRecord::Relation.prepend(
        Module.new do
          def exec_queries(*)
            arel.order(ChaoticOrder::Random.for(connection.adapter_name)) if order_values.blank?
            super
          end
        end
      )
    end
  end
end
