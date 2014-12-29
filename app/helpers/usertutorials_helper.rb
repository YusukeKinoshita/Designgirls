module UsertutorialsHelper
  def usertutorial_image_for(usertutorial, size = '52')
    image_tag "/docs7/#{usertutorial.image}", size: size, class: :gravatar
  end
end