class Answer < ActiveRecord::Base
  belongs_to :question
  # And so is the Answer
  has_many :comments, as: :commentable
  acts_as_votable
end
