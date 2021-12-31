# frozen_string_literal: true

module ChaoticOrder
  class Railtie < Rails::Railtie
    config.to_prepare do
      if ChaoticOrder::Config.enabled? || ENV["CHAOTIC_ORDER"] == "true"
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
end
