class CompletionsController < ApplicationController
  def create
    todo.complete!

    redirect_to todos_url
  end

  def destroy
    todo.mark_incomplete!

    redirect_to todos_url
  end

  private

  def todo
    current_user.todos.find_by(id: params[:todo_id])
  end
end
