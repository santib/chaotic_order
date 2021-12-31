# frozen_string_literal: true

RSpec.describe ChaoticOrder::Config do
  describe ".enable!" do
    subject { described_class.enable! }

    after { described_class.disable! }

    it "enables the gem" do
      expect { subject }.to change { ChaoticOrder::Config.enabled? }.from(false).to(true)
    end
  end

  describe ".disable!" do
    subject { described_class.disable! }

    before { described_class.enable! }

    it "disables the gem" do
      expect { subject }.to change { ChaoticOrder::Config.enabled? }.from(true).to(false)
    end
  end

  describe ".enabled?" do
    subject { described_class.enabled? }

    it "returns the state of the gem" do
      expect(subject).to eq(false)
    end
  end
end
