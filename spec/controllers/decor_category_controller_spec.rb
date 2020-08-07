require 'rails_helper'

RSpec.describe DecorCategoriesController, type: :controller do
  let(:user) { User.create(username: 'Lucy') }

  describe 'DecorCategory #create' do
    before(:example) do
      session[:user_id] = user.id
      @decor = user.decors.create(name: 'Rugs', price: 4)
      @category = user.categories.create(name: 'Bathroom', icon: 'bath')
    end
    context 'it redirects to user_decors#index when successful' do
      it 'redirects to the user_decors index page' do
        post :create, params: { user_id: user.id, decor_id: @decor.id, decor_category: { category_id: @category.id } }
        expect(response).to redirect_to(user_decors_path)
      end
    end
  end
end
