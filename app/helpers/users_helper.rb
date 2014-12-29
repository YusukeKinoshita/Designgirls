# ここもよくわからん
module UsersHelper
	# 引数(user)は何でもいい。show.htmlの中の<%= profile_image_for @user %>の第一引数@userが,
	# こちらの引数に代入される
  def profile_image_for(user, size = 'auto')
    image_tag "/docs/#{user.image}", size: size, class: :profile
  end
end