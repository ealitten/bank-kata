require './account'

describe Account do

  subject(:account) { described_class.new }

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
  end

  describe '#withdraw' do
    it 'should remove specified amount from balance' do
      account = Account.new(750)
      account.withdraw(500)
      expect(account.balance).to eq 250
    end
  end
end