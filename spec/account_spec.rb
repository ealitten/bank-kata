require './account'
require 'timecop'

describe Account do

  starting_balance = 750
  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:account) { described_class.new(starting_balance, transaction_class) }

  describe '#initialize' do
    it 'should start with a balance of zero by default' do
      account = Account.new
      expect(account.balance).to eq 0
    end

    it 'should start with starting balance if supplied' do
      account = Account.new(123)
      expect(account.balance).to eq 123
    end
  end

  describe '#deposit' do

  before { Timecop.freeze }
  after { Timecop.return }

    it 'should add specified amount to balance' do
      expect{account.deposit(500)}.to change {account.balance}.by(500)
    end

     
    it 'should create a new transaction with amount, new_balance, date' do
      amount = 500
      account.withdraw(amount)
      expect(transaction_class).to have_received(:new).with(-amount, starting_balance - amount, DateTime.now)
    end
    

    it 'should add deposit to transaction history' do
      account.deposit(500)
      expect(account.transactions).to include(transaction)
    end
  end

  describe '#withdraw' do

  before { Timecop.freeze }
  after { Timecop.return }

    it 'should remove specified amount from balance' do
      amount = 500
      account.withdraw(amount)
      expect(account.balance).to eq starting_balance - amount
    end

    it 'should create a new transaction with amount, new_balance, date' do
      amount = 500
      account.deposit(amount)
      expect(transaction_class).to have_received(:new).with(amount, starting_balance + amount, DateTime.now)
    end

    it 'should add withdrawal to transaction history' do
      account.withdraw(500)
      expect(account.transactions).to include(transaction)
    end
  end
end