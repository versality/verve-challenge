shared_context 'synced products', shared_context: :metadata do
  before(:all) do
    VCR.use_cassette('verve-api/common') do
      store_products = ::Remote::Product.store_products(1)
      product_service = ::ProductService.new(store_products)
      product_service.save_all
    end
  end
end