class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @transaction_array = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_array << Transaction.new(:credit, amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_array << Transaction.new(:debit, amount, @balance)
  end

  def print_statement(printer_method = AccountPrinter.new)
    printer_method.print_statement(@transaction_array)
  end
end
