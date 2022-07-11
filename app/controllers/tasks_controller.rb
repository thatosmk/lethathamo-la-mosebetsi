# frozen_string_literal: true

class TasksController < ApplicationController

  def new
    @list ||= list
  end

  def create
    @list = list
    @task = list.cards.build(task_params.merge({ board_id: list.board_id}))

    if @task.valid?
      @task.save

      AppServicesJob.perform_later(
        'Boards::CreateCardOnTrelloService',
        { list: list, card: @task }
      )

      redirect_to board_path(list.board)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

    def list
      @_list ||= List.find(params[:list_id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :list_id)
    end
end
