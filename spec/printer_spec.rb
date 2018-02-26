require './printer'

describe Printer do

  let(:transaction) { double :transaction, amount: 123, new_balance: 456, date: DateTime.new(2001,2,3,4,5,6) }
  subject(:printer) { described_class.new }

  describe '#print_transaction_history' do

    it 'should print out column headings' do
      transactions = []
      expect{printer.print_transaction_history(transactions)}.to output(<<-MESSAGE).to_stdout
date || credit || debit || balance
      MESSAGE
    end

    it 'should print out a transaction' do
      transactions = [transaction]
      expect{printer.print_transaction_history(transactions)}.to output(<<-MESSAGE).to_stdout
date || credit || debit || balance
03/02/2001 || 123.00 ||  || 456.00
      MESSAGE
    end

  end

end