require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  describe '#new' do
    subject { get new_board_path }

    it { expect(subject).to render_template(:new) }
  end

  describe '#create' do
    let(:board) { Board.create({ name: 'A different name'}) }
    let(:name)  { }

    subject { post board_tasks_path(board_id: board.id), params: params }

    let(:params) do
      {
        task: {
          board:    board,
          deadline: Time.current,
          name:     name,
          status:   rand(0..2)
        }
      }
    end

    context 'with valid params' do
      let(:name) { 'Another name' }
      it do
        expect{
          subject
        }.to change(Task, :count).by(1)
         .and change(board.tasks, :count).by(1)
      end
      it { expect(subject).to redirect_to(board_path(board)) }
    end

    context 'with invalid params' do
      context 'without name param' do
        let(:name) { }

        it { expect{subject}.to_not change(Task, :count) }
      end

      it { expect(subject).to render_template(:new) }
    end
  end
end
