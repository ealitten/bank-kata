require './account'

describe Account do

  subject(:account) { described_class.new }

  it 'should start with a balance of zero' do
    expect(account.balance).to eq 0
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