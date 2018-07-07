require 'rails_helper'

feature 'Product search', type: :feature do
  include_context 'synced products'

  scenario 'User sorts product by name ascending', js: true do
    visit '/'

    select 'Name (A to Z)', from: 'Order'
    expect(page).to have_css('.product:nth-child(1) .name', text: '4 Monos Madrid Blanco 2015')
  end

  scenario 'User sorts product by name descending', js: true do
    visit '/'

    select 'Name (Z to A)', from: 'Order'
    expect(page).to have_css('.product:nth-child(1) .name', text: 'Zalto \'Champagne\' Glass')
  end

  scenario 'User sorts product by price ascending', js: true do
    visit '/'

    select 'Price (low to high)', from: 'Order'
    expect(page).to have_css('.product:nth-child(1) .name', text: 'RAMONA \'Ruby Grapefruit\'')
  end

  scenario 'User sorts product by price descending', js: true do
    visit '/'

    select 'Price (high to low)', from: 'Order'
    expect(page).to have_css('.product:nth-child(1) .name', text: 'Dom Perignon Champagne \'P3\' 1983')
  end
end