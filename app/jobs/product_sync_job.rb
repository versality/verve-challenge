class ProductSyncJob < ApplicationJob
  STORES = %w(1) 
  
  queue_as :default
  
  def perform(*args)
    # Because API can have tens of thousands of items, would make sense to run in parallel
    # TODO add corresponding queue for parallel execution and slice items into smaller chunks
    STORES.each do |store_id|
      store_products = ::Remote::Product.store_products(store_id)

      product_service = ::ProductService.new(store_products)
      product_service.save_all
      product_service.update_stock
    end
  end
end
