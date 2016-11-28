require_relative 'spec_helper'

describe Transaction do
  subject { described_class.new(:credit, 50) }

  it "has an amount" do
    expect(subject.amount).to eq(50)
  end

  describe "transaction has a type" do
    it "can be a credit" do
      transaction = Transaction.new(:credit, 50)
      expect(transaction.type).to eq(:credit)
    end

    it "can be a debit" do
      transaction = Transaction.new(:debit, 50)
      expect(transaction.type).to eq(:debit)
    end
  end

  it "has a date of transaction" do
    date_today = Date.now
    expect(subject.date).to eq(Date.now)
  end
  #
  # it "credits have a positive amount" do
  #   transaction = Transaction.new(:credit, 50)
  #   expect(transaction.amount).to eq(50)
  # end
  #
  # it "debits have a negative amount" do
  #   transaction = Transaction.new(:debit, 50)
  #   expect(transaction.amount).to eq(50)
  # end
end
