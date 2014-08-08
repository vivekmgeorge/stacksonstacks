class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable

  acts_as_votable
end
