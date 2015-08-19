require 'rails_helper'

describe CompletionsController, type: :controller do
  include SessionsHelper

  context 'given an authenticated user' do
    describe 'POST #create' do
      it 'responds with HTTP success' do
        todo = signed_in_user_with_todos.todos.first

        post :create, todo_id: todo.id

        expect(response).to redirect_to todos_url
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to todos list' do
        todo = signed_in_user_with_todos.todos.first

        delete :destroy, todo_id: todo.id

        expect(response).to redirect_to todos_url
      end
    end
  end

  def signed_in_user_with_todos
    create(:user_with_todos).tap do |user|
      sign_in user
    end
  end
end
