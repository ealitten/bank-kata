class Account

  def initialize(starting_balance = 0)
    @balance = starting_balance
    @transactions = []
  end

  def balance
    @balance.dup
  end

  def withdraw(amount)
    @balance -= amount
  end

  def deposit(amount)
    @balance += amount
  end

end