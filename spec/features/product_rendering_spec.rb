require 'rails_helper'

feature 'Product rendering', type: :feature do
  include_context 'synced products'

  scenario 'Visitor is presented with 10 products along with information' do
    visit '/'

    expect(page).to have_selector('.product', count: 10)
    expect(page).to have_selector('.product img', count: 10)
    expect(page).to have_selector('.product .name', count: 10)
    expect(page).to have_selector('.product .producer', count: 10)
  end

  context 'when product/s become out of stock' do
    include_context 'synced products'

    before(:all) do
      VCR.use_cassette('verve-api/common-minus-one') do
        store_products = ::Remote::Product.store_products(1)
        product_service = ::ProductService.new(store_products)
        product_service.update_stock
      end
    end
    
    scenario 'Visitor is presented with one product out of stock' do
      visit '/'

      expect(page).to have_selector('.product.out-of-stock', count: 1)
    end
  end
end