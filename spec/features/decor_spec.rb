require 'rails_helper'

feature 'decor features', type: :feature do
  feature 'making a new decor' do
    before(:each) do
      @user = User.create(username: 'Allan')
      @user.categories.create(name: 'Bathroom', icon: 'bath')
      visit '/login'
      fill_in 'session[username]', with: 'Allan'
      click_on 'Log in'
    end

    scenario 'create a new decor' do
      visit new_user_decor_path(@user)
      fill_in 'decor[name]', with: 'Rugs'
      fill_in 'decor[price]', with: 10
      select 'Bathroom'
      click_on 'New Decor'
      expect(page).to have_content('Rugs')
      expect(current_path).to eq("/users/#{@user.id}/decors")
    end
  end

  feature 'seeing all decors' do
    before(:each) do
      @user = User.create(username: 'Allan')
      visit '/login'
      fill_in 'session[username]', with: 'Allan'
      click_on 'Log in'
    end

    scenario 'viewing the decors index page' do
      visit user_decors_path(@user)
      expect(page).to have_link('Add New Decor', href: new_user_decor_path(@user))
    end

    scenario 'viewing all unlisted decors' do
      visit user_unlisted_decor_path(@user)
      expect(page).to have_link('Add New Decor', href: new_user_decor_path(@user))
    end
  end

  #   feature 'seeing category show page' do
  #     before(:each) do
  #      @user = User.create(username: 'Allan')
  #      @category = @user.categories.create(name: 'Bathroom', icon: "bath")
  #     end
  #     scenario 'viewing category show page' do
  #       visit category_url(@category.id)
  #       expect(page).to have_content("No decors available for this category.")
  #     end
  #   end
end
