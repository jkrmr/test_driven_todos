require 'rails_helper'

describe TodosController do
  include SessionsHelper

  context 'with an unauthenticated user' do
    describe 'GET #index' do
      it 'redirects to the login page' do
        get :index

        expect(response).to redirect_to new_session_url
      end
    end
  end

  context 'with an authenticated user' do
    describe 'GET #index' do
      it 'responds with success' do
        sign_in create(:user)

        get :index

        expect(response).to be_success
      end

      it 'renders the index template' do
        sign_in create(:user)

        get :index

        expect(response).to render_template :index
      end

      it 'displays todos belonging to the user' do
        user = create(:user_with_todos)
        sign_in user

        get :index

        expect(assigns(:todos)).to eq user.todos
      end
    end

    describe 'GET #new' do
      it 'responds with success' do
        sign_in create(:user)

        get :new

        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'redirects to todo index' do
          sign_in create(:user)

          post :create, todo: { title: 'A new todo.' }

          expect(response).to redirect_to todos_url
        end
      end

      context 'with invalid params' do
        it 'responds with :new template' do
          sign_in create(:user)

          post :create, todo: { title: '' }

          expect(response).to render_template(:new)
        end
      end
    end
  end
end
