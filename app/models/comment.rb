class Comment < ActiveRecord::Base
	# Again, in the model
  belongs_to :commentable, polymorphic: true
end
