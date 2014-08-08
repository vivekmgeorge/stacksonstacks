class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :tags, through: :questiontags
  has_many :votes, as: :voteable
  has_many :responses, as: :responsable
end
