class CompletionsController < ApplicationController
  def create
    current_user.todos.find_by(id: params[:todo_id]).touch(:completed_at)
    redirect_to todos_url
  end
end
