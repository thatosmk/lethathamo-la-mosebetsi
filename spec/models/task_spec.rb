require 'rails_helper'

RSpec.describe Task, type: :model do

  subject { described_class.new(attributes) }

  let(:attributes) { { name: name, status: 0, board: board, deadline: Time.current } }
  let(:name)       { }
  let(:board)      { }

  describe '#valid' do
    before { subject.valid? }

    context 'when valid' do
      let(:name)  { 'A different name' }
      let(:board) { Board.create({ name: 'New board'})}

      it { expect(subject).to be_valid }
    end

    context 'when invalid' do
      context 'without name' do
        let(:board) { Board.create({ name: 'New board'})}

        it { expect(subject).to_not be_valid }
      end

      context 'without board' do
        let(:name)  { 'A different name' }

        it { expect(subject).to_not be_valid }
      end
    end
  end
end
