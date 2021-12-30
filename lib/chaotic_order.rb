# frozen_string_literal: true

require "rails"
require_relative "chaotic_order/version"
require_relative "chaotic_order/manager"

module ChaoticOrder
  class Error < StandardError; end

  class Railtie < Rails::Railtie
    config.to_prepare do
      ::ActiveRecord::Relation.prepend(
        Module.new do
          def exec_queries(*)
            ChaoticOrder::Manager.new(arel, connection.adapter_name).set_random_order
            super
          end
        end
      )
    end
  end
end
