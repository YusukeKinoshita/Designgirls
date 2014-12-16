module CategoriesHelper
  def category_image_for(category, size = '52')
    image_tag "/docs4/#{category.image}", size: size, class: :gravatar
  end

  def profile_image_for(user, size = '52')
    image_tag "/docs/#{user.image}", size: size, class: :gravatar
  end
end
