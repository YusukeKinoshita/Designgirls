class Category < ActiveRecord::Base
  has_many :tutorials
  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true
end
