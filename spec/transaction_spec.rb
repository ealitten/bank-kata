require './lib/transaction'
require 'timecop'

describe Transaction do

  Timecop.freeze do

    subject(:transaction) { described_class.new(1000, 1500, DateTime.now) }

    it 'should store amount' do
      expect(transaction.amount).to eq 1000
    end

    it 'should store new balance' do
      expect(transaction.new_balance).to eq 1500
    end

    it 'should store its creation date' do
      expect(transaction.date.strftime("%d-%m-%Y")).to eq DateTime.now.strftime("%d-%m-%Y")
    end

  end

end