require 'rails_helper'

RSpec.describe 'Index person', type: :system do
  scenario 'openening page' do
    visit root_path

    within('#intro') do
      expect(page).to have_content('A long time ago, in a galaxy far, far away...')
    end

    expect(page).to have_selector('td', count: 82)
  end
end
