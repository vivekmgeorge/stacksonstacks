class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable

  acts_as_votable

  def score
  	self.votes_for.count - self.get_dislikes.count
  end
end
