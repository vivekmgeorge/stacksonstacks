class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :comments, as: :commentable
  acts_as_votable
end
