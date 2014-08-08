class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many :votes, as: :voteable
  has_many :responses, as: :responsable
end
