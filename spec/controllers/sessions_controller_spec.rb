require 'rails_helper'

describe SessionsController do
  describe 'GET #new' do
    it 'returns http success' do
      get :new

      expect(response).to be_success
    end

    it 'renders the :new template' do
      get :new

      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'returns http success' do
        valid_user = create(:user)

        post :create, session: { email: valid_user.email }

        expect(response).to redirect_to root_url
      end
    end

    context 'with invalid credentials' do
      it 're-renders the login page' do
        post :create, session: { email: 'not_found_email@example.com' }

        expect(response).to render_template :new
      end
    end
  end
end
