# frozen_string_literal: true

module ChaoticOrder
  class Config
    def self.enable!
      @enabled = true
    end

    def self.disable!
      @enabled = false
    end

    def self.enabled?
      !!@enabled
    end
  end
end
