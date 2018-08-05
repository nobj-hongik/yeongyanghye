class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :answer_comments, dependent: :destroy
  has_many :answer_likes, dependent: :destroy
  has_many :answer_liked_users, through: :answer_likes, source: :user, dependent: :destroy
end
