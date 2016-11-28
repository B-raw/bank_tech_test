require_relative 'spec_helper'

describe AccountPrinter do
  subject { described_class.new }
  TEST_TITLE_STRING = " date     || credit   || debit    || balance  \n"
  CREDIT_STRING     = " 28/11/16 || 50       ||          || 50       \n"
  DEBIT_STRING     =  " 28/11/16 ||          || 100      || 50       \n"


  let(:credit_transaction) {double(:transaction, :amount => 50, :type => :credit, :date=> "28/11/16", :balance_snapshot => 50, :is_credit => true )}
  let(:debit_transaction) {double(:transaction, :amount => 100, :type => :debit, :date=> "28/11/16", :balance_snapshot => 50, :is_credit => false )}

  it "prints a title line" do
    expect(subject.print_statement([])).to eq TEST_TITLE_STRING
  end

  it "prints a single transaction" do
    expected_string = TEST_TITLE_STRING + CREDIT_STRING
    expect(subject.print_statement([credit_transaction])).to eq(expected_string)
  end

  it "prints multiple transactions" do
    expected_string = TEST_TITLE_STRING + DEBIT_STRING + CREDIT_STRING + CREDIT_STRING
    expect(subject.print_statement([credit_transaction, credit_transaction, debit_transaction])).to eq(expected_string)
  end
end
