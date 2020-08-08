require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { User.create(username: 'Lucy') }

  describe 'Category #create' do
    before(:example) do
      session[:user_id] = user.id
    end
    context 'it redirects to categories#index when successful' do
      it 'redirects to the categories index page' do
        post :create, params: { category: { name: 'Bathroom', icon: 'bath' } }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'it render to new template when unsuccessful' do
      it 'render new template' do
        post :create, params: { category: { name: '', icon: 'bath' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'Category #update' do
    before(:example) do
      session[:user_id] = user.id
      @category = user.categories.create(name: 'Bathroom', icon: 'bath')
    end
    context 'it redirects to categories#index when successful' do
      it 'redirects to the categories index page' do
        patch :update, params: { id: @category.id, category: { name: 'Bathroom decor', icon: 'bath' } }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'it render to edit template when unsuccessful' do
      it 'render new template' do
        patch :update, params: { id: @category.id, category: { name: '', icon: 'bath' } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'category #index' do
    before(:example) do
      session[:user_id] = user.id
    end
    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'category #show' do
    before(:example) do
      session[:user_id] = user.id
    end
    it 'renders show template' do
      @category = user.categories.create(name: 'Bathroom', icon: 'bath')
      get :show, params: { id: @category.id }
      expect(response).to render_template(:show)
    end
  end
end
