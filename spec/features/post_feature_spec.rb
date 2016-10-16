require 'rails_helper'

feature Post do

  context 'No posts added' do
    scenario 'Message displayed for no posts on homepage' do
      visit '/'
      expect(page).to have_content('No posts added yet')
    end
  end

  # context 'users must be signed in to post a splat' do
  #   scenario 'new posts path unavailable to guest users' do
  #     visit '/'
  #     expect(page).to_not have_content("New splat")
  #     expect(current_path).to eq("/posts/new")
  #
  #     visit '/posts/new'
  #     expect(current_path).to eq('/')
  #   end
  # end

  context 'users are signed in' do

    let!(:user){ User.create(email: "user@example.com", password: "123456") }

    before do
      visit '/'
      click_link("Sign in")
      fill_in("Email", with: "user@example.com")
      fill_in("Password", with: "123456")
      click_button("Log in")
    end

    scenario 'should display image after uploading splat' do
      visit '/'
      click_link("New splat")
      expect(current_path).to eq("/posts/new")

      fill_in("post_caption", with: "Troll face!")
      attach_file("post_image", Rails.root + "spec/test_images/trollface.jpg")
      click_button("Upload splat")

      expect(page).to have_content("Troll face!")
      expect(page).to have_css("img[src*='trollface.jpg']")
    end
  end
end
