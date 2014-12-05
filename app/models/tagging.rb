class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :category

  has_many :taggings
end
