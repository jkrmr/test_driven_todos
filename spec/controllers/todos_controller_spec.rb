require 'rails_helper'

describe TodosController do

  context 'with an unauthenticated user' do
    describe 'GET #index' do
      it 'redirects to the login page' do
        get :index

        expect(response).to redirect_to new_session_url
      end
    end
  end

  context 'with an authenticated user' do
    before do
      user = create(:user)
      session[:current_email] = user.email
    end

    describe 'GET #index' do
      it 'responds with success' do
        get :index

        expect(response).to be_success
      end

      it 'renders the index template' do
        get :index

        expect(response).to render_template :index
      end

      it 'displays all available available_todos' do
        available_todos = create_list(:todo, 5)

        get :index

        expect(assigns(:todos)).to eq available_todos
      end
    end

    describe 'GET #new' do
      it 'responds with success' do
        get :new

        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'redirects to todo index' do
          post :create, todo: { title: 'A new todo.' }

          expect(response).to redirect_to todos_url
        end
      end

      context 'with invalid params' do
        it 'responds with :new template' do
          post :create, todo: { title: '' }

          expect(response).to render_template(:new)
        end
      end
    end
  end
end
