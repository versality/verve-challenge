require 'rails_helper'

feature 'Product search', type: :feature do
  include_context 'synced products'

  scenario 'User searches product by name', js: true do
    visit '/'

    find(:css, 'input.q').set('Venezia-Giulia')
    expect(page).to have_css('.name', text: 'Venezia-Giulia')
  end

  scenario 'User searches product by region', js: true do
    visit '/'
    
    find(:css, 'input.q').set('Piedmont')
    expect(page).to have_css('.name', text: 'Giovanni Almondo')
  end

  scenario 'User searches product with less than 3 chars', js: true do
    visit '/'

    find(:css, 'input.q').set('za')
    expect(page).to_not have_css('.name', text: 'Zalto')
  end

  scenario 'User searches with single or double quotes', js: true do
    visit '/'

    find(:css, 'input.q').set('za\'')
    expect(page).to_not have_css('.name', text: 'Zalto')

    find(:css, 'input.q').set('za"')
    expect(page).to_not have_css('.name', text: 'Zalto')
  end

  scenario 'User searches for case insensitive name', js: true do
    visit '/'

    find(:css, 'input.q').set('zalto')
    expect(page).to have_css('.name', text: 'Zalto')
  end
end