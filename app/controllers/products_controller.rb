class ProductsController < ApplicationController
  layout 'product'

  def index
    @products = Product.order(name: 'ASC').first(10)
  end
end
