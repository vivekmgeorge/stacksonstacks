class Answer < ActiveRecord::Base
  belongs_to :question
  # And so is the Answer
  has_many :comments, as: :commentable
  acts_as_votable

  def score
  	self.get_upvotes.count - self.get_downvotes.count
  end
end
