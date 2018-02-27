class Transaction

  def initialize(amount, new_balance, date)
    @amount = amount
    @new_balance = new_balance
    @date = date
  end

  def amount
    @amount.dup
  end

  def new_balance
    @new_balance.dup
  end

  def date
    @date.dup
  end

end