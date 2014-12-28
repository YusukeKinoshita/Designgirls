class User < ActiveRecord::Base
  has_many :tutorials, dependent: :destroy
  has_many :products, dependent: :destroy
  # お気に入り
  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product
  has_many :likes
  has_many :like_usertutorials, through: :likes, source: :usertutorial
  has_many :completes
  has_many :finishes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :recoverable,
         :registerable, :rememberable, :trackable, :validatable
 
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.info.nickname,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    User.create_unique_email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end
 
  # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end

  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end

  def favorite?(product)
    favorites.find_by(product_id: product.id)
  end

  def favorite!(product)
    favorites.create!(product_id: product.id)
  end

  def unfavorite!(product)
    favorites.find_by(product_id: product.id).destroy
  end

  def like?(usertutorial)
    likes.find_by(usertutorial_id: usertutorial.id)
  end

  def like!(usertutorial)
    likes.create!(usertutorial_id: usertutorial.id)
  end

  def unlike!(usertutorial)
    likes.find_by(usertutorial_id: usertutorial.id).destroy
  end

  def complete?(slide)
    completes.find_by(slide_id: slide.id)
  end

  def complete!(slide)
    completes.create!(slide_id: slide.id)
  end

  def uncomplete!(slide)
    completes.find_by(slide_id: slide.id).destroy
  end

  def finish?(userslide)
    finishes.find_by(userslide_id: userslide.id)
  end

  def finish!(userslide)
    finishes.create!(userslide_id: userslide.id)
  end

  def unfinish!(userslide)
    finishes.find_by(userslide_id: userslide.id).destroy
  end

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
end