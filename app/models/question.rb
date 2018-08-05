class Question < ApplicationRecord
  belongs_to :user
  has_many :question_comments
  has_many :answers
  has_many :question_likes
  has_many :question_liked_users, through: :question_likes, source: :user
end
