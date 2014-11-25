class Slide < ActiveRecord::Base
  belongs_to :tutorial
  validates :title, presence: true
  # validates :tutorial_id, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :tutorial_id, presence: true



  def set_image(file)
      if !file.nil?
        file_name = file.original_filename
        # サーバー側に画像を保存している
        File.open("public/docs3/#{file_name}", 'wb'){|f| f.write(file.read)}
        # データベースに書き込んでいる（imageカラムに文字列を入れる）
        self.image = file_name
      end
  end


end