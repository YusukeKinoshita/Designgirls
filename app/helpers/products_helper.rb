module ProductsHelper
  def product_image_for(product, size = '52')
    image_tag "/docs5/#{product.image}", size: size, class: :product_image

  end
end
