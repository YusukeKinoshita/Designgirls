class Usertutorial < ActiveRecord::Base
  has_many :userslides, dependent: :destroy
  belongs_to :category
  belongs_to :user
  # お気に入り
  has_many :likes
  has_many :liking_users, through: :likes, source: :user

  has_many :tags
  has_many :categories, through: :tags

  validates :title, presence: true
  # validates :user_id, presence: true
  # validates :category_id, presence: true
  validates :description, presence: true

  # お気に入り
  has_many :likes
  has_many :liking_users, through: :likes, source: :user

  accepts_nested_attributes_for :userslides


  def set_image(file)
      if !file.nil?
        file_name = file.original_filename
        # サーバー側に画像を保存している
        File.open("public/docs7/#{file_name}", 'wb'){|f| f.write(file.read)}
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

  def tag(category)
    tags.find_by(category_id: category_id)
  end
end
