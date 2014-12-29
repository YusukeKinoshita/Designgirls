class Question < ActiveRecord::Base
	belongs_to :tutorial
	has_many :selects
end
