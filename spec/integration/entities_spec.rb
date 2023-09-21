require 'rails_helper'

RSpec.describe 'Entities', type: :feature do
  before(:each) do
    @user = User.find_or_create_by(email: 'test@test.com') do |user|
      user.name = 'User1'
      user.password = '123456'
    end

    login_as(@user, scope: :user)
  end

  it 'checks if groups can be accessed' do
    visit groups_path
    expect(page).to have_content('Categories')
  end

  it 'can log out' do
    visit root_path
    click_button 'Logout'
    expect(page).to have_content('Signed out successfully')
  end
end
