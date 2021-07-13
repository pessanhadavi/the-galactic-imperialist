require 'rails_helper'

RSpec.describe 'Show person', type: :system do
  scenario 'searching character' do
    visit root_path
    fill_in '#search-inp', with: 'Leia'
    click_button '#search-btn'

    expect(page).to have_content('My name is Leia Organa')
  end
end
