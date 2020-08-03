require 'rails_helper'

RSpec.describe DecorsController, type: :controller do
  let(:user) { User.create(username: 'Lucy') }

  describe 'decor #create' do
    before(:example) do
      session[:user_id] = user.id
    end
    context 'it redirects to user_decors#index when successful' do
      it 'redirects to the user_decors index page' do
        post :create, params: { user_id: user.id, decor: { name: 'Rugs', price: 10 } }
        expect(response).to redirect_to(user_decors_path)
      end
    end

    context 'it render to new template when unsuccessful' do
      it 'render new template' do
        post :create, params: { user_id: user.id, decor: { name: '', price: 10 } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'Decor #update' do
    before(:example) do
      session[:user_id] = user.id
      @decor = user.decors.create(name: 'Rugs', price: 8)
    end
    context 'it redirects to user_decors#index when successful' do
      it 'redirects to the user_decors index page' do
        patch :update, params: { id: @decor.id, user_id: user.id, decor: { name: 'Rugs', price: 10 } }
        expect(response).to redirect_to(user_decors_path)
      end
    end

    context 'it render to edit template when unsuccessful' do
      it 'render new template' do
        patch :update, params: { id: @decor.id, user_id: user.id, decor: { name: '', price: 8 } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'decor #index' do
    before(:example) do
      session[:user_id] = user.id
    end
    it 'renders index template' do
      get :index, params: { user_id: user.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'decor #unlisted' do
    it 'renders unlisted template' do
      session[:user_id] = user.id
      get :unlisted, params: { user_id: user.id }
      expect(response).to render_template(:unlisted)
    end
  end
end
