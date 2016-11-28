class Transaction

  attr_reader :amount, :type, :date, :balance_snapshot

  def initialize(type, amount, balance_snapshot)
    @amount = amount
    @type = type
    @date = parse_date(Date.today)
    @balance_snapshot = balance_snapshot
  end

  def is_credit
    @type == :credit
  end

private

  def parse_date(date)
    date.strftime("%d/%m/%y")
  end
end
