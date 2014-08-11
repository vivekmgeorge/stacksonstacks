class Question < ActiveRecord::Base
	default_scope { order('created_at DESC') }

  has_many :answers
  has_many :comments, as: :commentable
  belongs_to :user

  acts_as_votable

  def score
  	self.get_upvotes.count - self.get_downvotes.count
  end
end
