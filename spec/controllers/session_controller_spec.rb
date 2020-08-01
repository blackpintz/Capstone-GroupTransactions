require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user1) { User.create(username: 'Joy') }
  describe 'POST #create' do
    context 'With valid params' do
      it 'logins a user' do
        post :create, params: { session: { username: user1.username } }
        expect(response).to redirect_to(user_url(User.find_by(username: user1.username)))
      end
    end

    context 'With invalid params' do
      it 'renders the login template' do
        post :create, params: { session: { username: 'Rose' } }
        expect(response).to render_template(:new)
      end
    end
  end
end
