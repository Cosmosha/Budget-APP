require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before(:each) do
    @user = User.create(name: 'User1', email: 'test@test.com', password: '123456')
    login_as(@user, scope: :user)
  end

  it 'can access the groups index page' do
    visit groups_path
    expect(page).to have_content('Categories')
  end

  it 'can log out' do
    visit root_path
    click_button 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end
