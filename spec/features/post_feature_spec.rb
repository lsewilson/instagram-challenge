require 'rails_helper'

feature Post do
  context 'No posts added' do
    scenario 'Message displayed for no posts on homepage' do
      visit '/'
      expect(page).to have_content('No posts added')
    end
  end
end
