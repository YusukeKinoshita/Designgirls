class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true

  has_many :tutorials, dependent: :destroy


  def set_image(file)
      if !file.nil?
        file_name = file.original_filename
        # サーバー側に画像を保存している
        File.open("public/docs4/#{file_name}", 'wb'){|f| f.write(file.read)}
        # データベースに書き込んでいる（imageカラムに文字列を入れる）
        self.image = file_name
      end
  end

  def tag(category)
    tags.find_by(id: params[:id])
  end
end