require_relative 'spec_helper'
require 'timecop'

describe Transaction do
  subject { described_class.new(:credit, 50, 150 ) }
  DATE_STRING = "28/11/16"

  before do
    Timecop.freeze(Time.local(2016, 11, 28, 12, 0, 0))
  end

  it "has an amount" do
    expect(subject.amount).to eq(50)
  end

  describe "transaction has a type" do
    it "can be a credit" do
      transaction = Transaction.new(:credit, 50, 150)
      expect(transaction.type).to eq(:credit)
    end

    it "can be a debit" do
      transaction = Transaction.new(:debit, 50, 150)
      expect(transaction.type).to eq(:debit)
    end
  end

  it "has a date of transaction" do
    expect(subject.date).to eq(DATE_STRING)
  end

  it "keeps a snapshot of the balance" do
    expect(subject.balance_snapshot).to eq(150)
  end
end
