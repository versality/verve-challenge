# ProductService
#
# @example
#
#   product_service = ProductService.new(Remote::Product.all)
#   product_service.save_all 
#   product_service.update_stock
#
# @param [Remote::Product] remote_products

class ProductService
  def initialize(remote_products)
    @remote_products = remote_products
  end

  def save_all
    @remote_products.each do |remote_product|
      save remote_product
    end
  end

  def save(remote_product)
    unless ::Product.exists?(product_id: remote_product.id)
      ::Product.create(
        product_id:   remote_product.id,
        name:         remote_product.name,
        producer:     remote_product.producer,
        region:       remote_product.region,
        image_url:    remote_product.image_url,
        price_in_usd: remote_product.price_in_usd
      )
    end
  end

  def update_stock
    # TODO replace with more performant approach to handle larger amount of items
    # With significant increase in items count from API using pluck and SQL IN might be a major bottleneck
    ids = @remote_products.pluck(:id)
    ::Product.where.not(product_id: ids).update_all(in_stock: false)
  end
end