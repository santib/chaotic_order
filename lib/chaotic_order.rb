# frozen_string_literal: true

require_relative "chaotic_order/version"

module ChaoticOrder
  class Error < StandardError; end

  class Railtie < Rails::Railtie
    config.to_prepare do
      ::ActiveRecord::Relation.prepend(
        Module.new do
          def exec_queries(*)
            arel.order('RANDOM()') if order_values.blank?
            super
          end
        end
      )
    end
  end
end
