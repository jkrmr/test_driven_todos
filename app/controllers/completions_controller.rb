class CompletionsController < ApplicationController
  def create
    todo.touch(:completed_at)

    redirect_to todos_url
  end

  private

  def todo
    current_user.todos.find_by(id: params[:todo_id])
  end
end
