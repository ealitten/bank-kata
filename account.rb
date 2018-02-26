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

  def transactions
    @transactions.dup
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << @transaction_class.new(amount)
  end

  def deposit(amount)
    @balance += amount
    @transactions << @transaction_class.new(amount)
  end

end