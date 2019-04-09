# frozen_string_literal: true

describe Accounts::EthereumGroup::GetTransactions do
  subject { described_class.new(address.address, count) }

  let(:address) { create(:address, :ethereum) }
  let(:response) do
    data = (1..50).each_with_object([]) do |count, array|
      array << { 'blockNumber' => count }
    end
    OpenStruct.new('result': data)
  end

  before do
    allow(subject).to receive(:fetch_data).and_return(response)
  end

  describe '#call' do
    context 'count is default' do
      let(:count) { 20 }

      it 'returns correct data count' do
        expect(subject.call.count).to eq 20
      end
    end

    context 'count is set' do
      let(:count) { 5 }

      it 'returns correct data count' do
        expect(subject.call.count).to eq 5
      end
    end
  end
end
