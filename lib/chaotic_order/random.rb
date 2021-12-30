# frozen_string_literal: true

module ChaoticOrder
  # Applies the random order for a certain connection adapter
  class Random
    class << self
      def for(adapter_name)
        if adapter_name =~ /mysql/i
          "RAND()"
        else
          "RANDOM()"
        end
      end
    end
  end
end
