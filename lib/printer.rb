class Printer

  def print_transaction_history(transactions)
    print_header
    output = transactions.map { |t|
      "#{t.date.strftime('%d/%m/%Y')} || #{sprintf('%.2f', t.amount) if t.amount > 0} || #{sprintf('%.2f', t.amount) if t.amount < 0} || #{sprintf('%.2f', t.new_balance)}"
               }.join {'\n'}
    print output
  end

  def print_header
    puts "date || credit || debit || balance"
  end

end