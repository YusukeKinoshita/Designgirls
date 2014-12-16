module SlidesHelper
  def slide_image_for(slide, size = '52')
    image_tag "/docs3/#{slide.image}", size: size, class: :gravatar
  end
end
