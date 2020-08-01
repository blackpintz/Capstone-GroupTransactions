require 'rails_helper'

feature 'category features', type: :feature do
  feature 'making a new category' do
    before(:each) do
      User.create(username: 'Allan')
      visit '/login'
      fill_in 'session[username]', with: 'Allan'
      click_on 'Log in'
    end

    scenario 'create a new category' do
      visit '/categories/new'
      fill_in 'category[name]', with: 'Bathroom'
      select 'bath'
      click_on 'New Category'
      expect(page).to have_content('Bathroom')
      expect(current_path).to eq('/categories')
    end
  end

  feature 'seeing all categories' do
    before(:each) do
      @user = User.create(username: 'Allan')
      @user.categories.create(name: 'Bathroom', icon: 'bath')
      @user.categories.create(name: 'Outdoor', icon: 'tree')
    end

    scenario 'viewing the categories index page' do
      visit categories_url
      expect(page).to have_content('Bathroom')
    end
  end

  feature 'seeing category show page' do
    before(:each) do
      @user = User.create(username: 'Allan')
      @category = @user.categories.create(name: 'Bathroom', icon: 'bath')
    end
    scenario 'viewing category show page' do
      visit category_url(@category.id)
      expect(page).to have_content('No decors available for this category.')
    end
  end
end
