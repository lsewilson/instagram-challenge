require 'rails_helper'

feature Post do
  context 'No posts added' do
    scenario 'Message displayed for no posts on homepage' do
      visit '/'
      expect(page).to have_content('No posts added')
    end
  end

  context 'posting a splat' do
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
