class Slide < ActiveRecord::Base
  belong_to :tutorial
  validates :title, presence: true
  validates :tutorial_id, presence: true
  validates :body, presence: true
  validates :image, presence: true
end