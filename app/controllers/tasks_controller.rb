# frozen_string_literal: true

class TasksController < ApplicationController

  def new
    @board ||= board
  end

  def create
    @board = board
    @task = board.tasks.build(task_params.merge({ status: 0}))

    if @task.valid?
      @task.save
      redirect_to board_path(board)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

    def board
      @_board ||= Board.find(params[:board_id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :board_id)
    end
end
