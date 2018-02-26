require './account'

describe Account do

  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:account) { described_class.new(750, transaction_class) }

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
    it 'should add specified amount to balance' do
      expect{account.deposit(500)}.to change {account.balance}.by(500)
    end

    it 'should create a new transaction' do
      account.withdraw(500)
      expect(transaction_class).to have_received(:new)
    end

    it 'should add deposit to transaction history' do
      account.deposit(500)
      expect(account.transactions).to include(transaction)
    end
  end

  describe '#withdraw' do

    it 'should remove specified amount from balance' do
      account.withdraw(500)
      expect(account.balance).to eq 250
    end

    it 'should create a new transaction' do
      account.withdraw(500)
      expect(transaction_class).to have_received(:new)
    end

    it 'should add withdrawal to transaction history' do
      account.withdraw(500)
      expect(account.transactions).to include(transaction)
    end
  end
end