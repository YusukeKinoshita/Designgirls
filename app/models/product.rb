class Product < ActiveRecord::Base
	# お気に入り
	has_many :favorites
	has_many :favoriting_users, through: :favorites, source: :user
	belongs_to :user
	mount_uploader :image, ImageUploader
end
