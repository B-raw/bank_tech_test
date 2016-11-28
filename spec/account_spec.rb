require_relative 'spec_helper'

describe Account do
  subject { described_class.new }

  it "has a balance" do
    expect(subject.balance).to equal(0)
  end

  it "can deposit money" do
    subject.deposit(100)
    expect(subject.balance).to equal(100)
  end

  it "can withdraw money" do
    subject.deposit(100)
    subject.withdraw(50)
    expect(subject.balance).to equal(50)
  end

end
