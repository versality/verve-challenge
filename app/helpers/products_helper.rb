module ProductsHelper
  def product_sort_tag
    # TODO replace name and price_in_usd to something else to avoid exposing table columns
    select_tag(
      'Order', 
      options_for_select([
        ['Name (A to Z)', 'name ASC'], 
        ['Name (Z to A)', 'name DESC'], 
        ['Price (low to high)', 'price_in_usd ASC'], 
        ['Price (high to low)', 'price_in_usd DESC']
      ]),
      class: 'q-sort'
    )
  end
end
