class TodosController < ApplicationController
  before_filter :authenticate

  def index
    @todos = Todo.where(user: current_user)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user

    if @todo.save
      redirect_to todos_url
    else
      render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
