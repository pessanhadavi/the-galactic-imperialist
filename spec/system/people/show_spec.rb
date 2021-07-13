require 'rails_helper'

RSpec.describe 'Show person', type: :system do
  scenario 'showing character' do
    visit root_path
    click_on 'C-3PO'

    expect(page).to have_content('My name is C-3PO')
  end

  scenario 'searching character' do
    visit root_path
    fill_in '#search-inp', with: 'Leia'
    click_button '#search-btn'
    click_on 'Leia Organa'

    expect(page).to have_content('My name is Leia Organa')
  end
end
