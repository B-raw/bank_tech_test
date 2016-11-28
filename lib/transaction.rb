class Transaction

  attr_reader :amount, :type

  def initialize(type, amount)
    @amount = amount
    @type = type
  end

end
