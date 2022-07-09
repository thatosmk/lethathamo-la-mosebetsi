require 'rails_helper'


RSpec.describe BoardsController, type: :request do

  describe '#index' do
    subject { get boards_path }

    it { expect(subject).to render_template(:index) }
  end

  describe '#new' do
    subject { get new_board_path }

    it { expect(subject).to render_template(:new) }
  end

  describe '#show' do
    subject { get board_path(board) }
    let(:board) { Board.create({ name: 'A different name'}) }

    it { expect(subject).to render_template(:show) }
  end

  describe '#create' do
    subject { post boards_path, params: params }

    let(:params) { { board: { name: name } } }

    context 'with valid params' do
      let(:name) { 'Another name' }
      it do
        expect{subject}.to change(Board, :count).from(0).to(1)
      end
      it { expect(subject).to redirect_to(board_path(Board.last)) }
    end

    context 'with invalid params' do
      let(:name) { }
      it do
        expect{subject}.to_not change(Board, :count)
      end
      it { expect(subject).to render_template(:new) }
    end
  end
end
