module UserslidesHelper
  def userslide_image_for(userslide, size = '52')
    image_tag "/docs6/#{userslide.image}", size: size, class: :gravatar
  end
end