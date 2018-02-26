class Printer

  def print_transaction_history(transactions)
    output = ""
    output << "date || credit || debit || balance\n"
    transactions.each { |t|
      output << "#{t.date.strftime('%d/%m/%Y')} || #{sprintf('%.2f', t.amount) if t.amount > 0} || #{sprintf('%.2f', t.amount) if t.amount < 0} || #{sprintf('%.2f', t.new_balance)}\n"
    }
    print output
  end

end