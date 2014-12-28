class Userslide < ActiveRecord::Base
  belongs_to :usertutorial
  validates :title, presence: true
  # validates :tutorial_id, presence: true
  validates :body, presence: true
  # validates :image, presence: true
  validates :usertutorial_id, presence: true
  has_many :finishes

  def image=(file)
      if !file.nil?
        file_name = file.original_filename
        # サーバー側に画像を保存している
        File.open("public/docs6/#{file_name}", 'wb'){|f| f.write(file.read)}
        # データベースに書き込んでいる（imageカラムに文字列を入れる）
        write_attribute(:image, file_name)
      end
  end
end
