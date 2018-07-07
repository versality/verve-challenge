class ProductsController < ApplicationController
  layout 'product'

  def index
    @products = Product.order(name: 'ASC')
  end
end
