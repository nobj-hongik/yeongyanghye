class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :answer_comments
  has_many :answer_likes
  has_many :answer_liked_users, through: :answer_likes, source: :user
end
