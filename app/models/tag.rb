class Tag < ActiveRecord::Base
	belongs_to :tutorial
	belongs_to :category
end
