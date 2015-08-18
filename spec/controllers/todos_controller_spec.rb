require 'rails_helper'

describe TodosController do
  describe 'GET #index' do
    it 'responds with success' do
      get :index

      expect(response).to be_success
    end
  end
end
