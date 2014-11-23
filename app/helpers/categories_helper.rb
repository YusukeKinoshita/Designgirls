module CategoriesHelper
  def slide_image_for(slide, size = '52')
    image_tag "/docs4/#{category.image}", size: size, class: :gravatar
  end
end
