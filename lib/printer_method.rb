class AccountPrinter

  def initialize
    @title_string = " date     || credit   || debit    || balance  \n"
  end

  def print_statement(transaction_array)
    string = @title_string
    transaction_array.reverse_each do |transaction|
      string += "#{pad_string(transaction.date)}||"\
                 "#{credit_or_debit_column(transaction)}||"\
                 "#{pad_string(transaction.balance_snapshot.to_s)}\n"
    end
    string
  end

private

  def pad_string(string)
    " " + string + (" " * (9 - string.length))
  end

  def credit_or_debit_column(transaction)
    if transaction.is_credit
      "#{pad_string(transaction.amount.to_s)}||#{(' ' * 10)}"
    else
      "#{(' ' * 10)}||#{pad_string(transaction.amount.to_s)}"
    end
  end

end
