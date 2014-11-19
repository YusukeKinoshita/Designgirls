class Tutorial < ActiveRecord::Base
  has_many :slides
  validates :title, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
end
