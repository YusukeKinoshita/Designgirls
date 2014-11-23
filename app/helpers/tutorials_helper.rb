module TutorialsHelper
  def tutorial_image_for(tutorial, size = '52')
    image_tag "/docs2/#{tutorial.image}", size: size, class: :gravatar
  end
end
