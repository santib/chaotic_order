# frozen_string_literal: true

require "active_record"

RSpec.describe ChaoticOrder::Railtie do
  subject { described_class.instance.config.to_prepare_blocks.each(&:call) }

  it "does nothing by default" do
    expect(ActiveRecord::Relation).to_not receive(:prepend)
    subject
  end

  context "when the toggle is on" do
    before do
      ChaoticOrder::Config.enable!
    end

    after do
      ChaoticOrder::Config.disable!
    end

    it "prepends code to ActiveRecord::Relation" do
      expect(ActiveRecord::Relation).to receive(:prepend)
      subject
    end
  end

  context "when the ENV VAR is set" do
    before do
      stub_const("ENV", ENV.to_h.merge("CHAOTIC_ORDER" => "true"))
    end

    it "prepends code to ActiveRecord::Relation" do
      expect(ActiveRecord::Relation).to receive(:prepend)
      subject
    end
  end
end
