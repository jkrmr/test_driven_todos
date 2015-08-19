require 'rails_helper'

describe CompletionsController, type: :controller do
  include SessionsHelper

  context 'given an authenticated user' do
    describe 'POST #create' do
      it 'responds with HTTP success' do
        user = create(:user_with_todos)
        sign_in user
        todo = user.todos.first

        post :create, todo_id: todo.id

        expect(response).to redirect_to todos_url
      end
    end
  end
end
