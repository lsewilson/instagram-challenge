require 'rails_helper'

feature User do

  let!(:user){ User.create(email: "user@example.com", password: "123456") }

  context "user not signed in and on the homepage" do
    it "allows a user to sign in" do
      visit('/')
      click_link('Sign in')

      fill_in('Email', with: 'user@example.com')
      fill_in('Password', with: '123456')
      click_button('Log in')

      expect(current_path).to eq("/")
      expect(page).to have_link('Sign out')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
