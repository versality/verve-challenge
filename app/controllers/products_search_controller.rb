class ProductsSearchController < ApplicationController
  def index
    # TODO replace ILIKE with full text search engines such as elasticsearch
    # Due to performance and better score results
    @products = Product.where(
      'name ILIKE ? OR region ILIKE ?', 
      "%#{params['query']}%", 
      "%#{params['query']}%"
    )
    .order(params[:order])
    .first(10)
  end
end

  
  