require 'rails_helper'

RSpec.describe Board, type: :model do

  subject { described_class.new(attributes) }

  let(:attributes) { { name: name } }
  let(:name)       { }

  describe '#valid' do
    before { subject.valid? }

    context 'when valid' do
      let(:name) { 'A different name' }

      it { expect(subject).to be_valid }
    end

    context 'when invalid' do
      it { expect(subject).to_not be_valid }
    end
  end
end
