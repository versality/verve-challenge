class Remote::Product
  include Her::Model

  collection_path 'banquet_feed.json'

  def self.store_products(store_id)
    # Using cache to reduce amount of repeating requests hitting API
    Rails.cache.fetch("banquet_feed/store/#{store_id}", expires_in: 1.minute) do
      where(store_id: store_id)
    end
  end
end
