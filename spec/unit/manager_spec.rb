# frozen_string_literal: true

RSpec.describe ChaoticOrder::Manager do
  let(:orders) { [] }
  let(:sql) { "SELECT * FROM users" }
  let(:arel) { double(orders: orders, to_sql: sql) }
  let(:adapter_name) { "PostgreSQL" }

  describe "#set_random_order" do
    subject { described_class.new(arel, adapter_name).set_random_order }

    it "sets a random order on the query" do
      expect(arel).to receive(:order).with("RANDOM()")
      subject
    end

    context "when there is already an order set" do
      let(:orders) { ["id"] }

      it "does not set a random order on the query" do
        expect(arel).to_not receive(:order)
        subject
      end
    end

    context "when there is already a DISTINCT set" do
      let(:sql) { "SELECT DISTINCT(*) FROM users" }

      it "does not set a random order on the query" do
        expect(arel).to_not receive(:order)
        subject
      end
    end

    context "when the adapter is MySQL" do
      let(:adapter_name) { "Mysql2" }

      it "does not set a random order on the query" do
        expect(arel).to receive(:order).with("RAND()")
        subject
      end
    end
  end
end
