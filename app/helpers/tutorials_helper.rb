module TutorialsHelper
  def tutorial_image_for(tutorial, size = 'auto')
    image_tag "/docs2/#{tutorial.image}", size: size, class: :tutorial_img
  end

  def tutorial_image_for2(tutorial, size = 'auto')
    image_tag "/docs2/#{tutorial.image}", size: size, class: :tutorial_img2
  end
end
