class Product < ActiveRecord::Base
	# お気に入り
	has_many :favorites
	has_many :favoriting_users, through: :favorites, source: :user
	belongs_to :user
	validates :title, presence: true
	validates :description, presence: true
	mount_uploader :image, ImageUploader

  def set_image(file)
      if !file.nil?
        file_name = file.original_filename
        # サーバー側に画像を保存している
        File.open("public/docs5/#{file_name}", 'wb'){|f| f.write(file.read)}
        # データベースに書き込んでいる（imageカラムに文字列を入れる）
        self.image = file_name
      end
  end

  # belongs_toで定義していると　tutorial.userが使える
  def user
  	# paramsは基本controllerの中でしか使えない
  	# チュートリアルテーブルの中からuser_idを探す
  	@user = User.find_by(id: self.user_id)
  end
end
