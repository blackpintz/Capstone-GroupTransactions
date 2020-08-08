require 'rails_helper'

feature 'authentication features', type: :feature do
  feature 'creating a new user' do
    before(:example) do
      visit root_url
    end

    scenario 'sign up new user' do
      fill_in 'user[username]', with: 'Rose'
      click_on 'Sign up'
      expect(page).to have_content('Welcome Rose')
      expect(current_path).to eq("/users/#{User.find_by(username: 'Rose').id}")
    end
  end

  feature 'visit the user show page' do
    before(:example) do
      @user = User.create(username: 'Rose')
      visit '/login'
      fill_in 'session[username]', with: 'Rose'
      click_on 'Log in'
    end

    scenario 'view user show page' do
      visit user_url(@user.id)
      expect(page).to have_link('My Decors.', href: user_decors_path(@user))
    end
  end

  feature 'Log in a user' do
    before(:example) do
      User.create(username: 'Rose')
    end

    scenario 'with valid params' do
      visit login_url
      fill_in 'session[username]', with: 'Rose'
      click_on 'Log in'
      expect(page).to have_content('Logged in successfully.')
      expect(current_path).to eq("/users/#{User.find_by(username: 'Rose').id}")
    end

    scenario 'with invalid params' do
      visit login_url
      fill_in 'session[username]', with: 'Winnie'
      click_on 'Log in'
      expect(page).to have_content('Wrong username.')
      expect(current_path).to eq('/login')
    end
  end

  feature 'Log out a user' do
    before(:example) do
      User.create(username: 'Allan')
      visit '/login'
      fill_in 'session[username]', with: 'Allan'
      click_on 'Log in'
    end
    scenario 'log out user' do
      click_on 'Log out'
      expect(page).to have_content('You are logged out.')
      expect(current_path).to eq('/login')
    end
  end
end
