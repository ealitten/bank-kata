require './transaction'

class Account

  def initialize(starting_balance = 0, transaction_class = Transaction)
    @balance = starting_balance
    @transactions = []
    @transaction_class = transaction_class
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