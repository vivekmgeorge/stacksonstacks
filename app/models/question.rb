class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable

  acts_as_votable

  def score
  	self.get_upvotes.count - self.get_downvotes.count
  end
end
