require_relative 'spec_helper'
require 'timecop'

=begin acceptance criteria
  Given a client makes a deposit of 1000 on 10-01-2012
    And a deposit of 2000 on 13-01-2012
    And a withdrawal of 500 on 14-01-2012
  When she prints her bank statement
  Then she would see
    date       || credit || debit   || balance
    14/01/2012 ||        || 500.00  || 2500.00
    13/01/2012 || 2000.00||         || 3000.00
    10/01/2012 || 1000.00||         || 1000.00
=end

describe "Bank system" do
  it "correctly handles a full acceptance test" do
    expected = " date     || credit   || debit    || balance  \n"\
               " 14/01/12 ||          || 500      || 2500     \n"\
               " 13/01/12 || 2000     ||          || 3000     \n"\
               " 10/01/12 || 1000     ||          || 1000     \n"

    account = Account.new
    Timecop.freeze(Time.local(2012, 1, 10, 12, 0, 0))
    account.deposit(1000)
    Timecop.freeze(Time.local(2012, 1, 13, 12, 0, 0))
    account.deposit(2000)
    Timecop.freeze(Time.local(2012, 1, 14, 12, 0, 0))
    account.withdraw(500)

    expect(account.print_statement).to eq(expected)
  end
end
