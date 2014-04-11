require 'spec_helper'

feature 'login' do

  background :all do
    User.create(email: 'kulio@gmail.com', password: '123', password_confirmation: '123')
  end

  scenario 'redirects to login page when not signed in' do
    visit '/'
    expect(current_path).to eq '/login'
  end

  scenario 'log in' do
    visit '/login'

    # fill in email
    fill_in 'Email', with: 'kulio@gmail.com'
    # fill in password
    fill_in 'Password', with: '123'
    # click sign-in
    click_button 'Sign in'

    expect(current_path).to eq '/'
  end

end