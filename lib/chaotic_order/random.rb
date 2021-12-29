# frozen_string_literal: true

module ChaoticOrder
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
