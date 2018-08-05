class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :nutritions
  has_many :magazines
  has_many :questions
  has_many :question_comments
  has_many :answers
  has_many :answer_comments
  has_many :question_liked_questions, through: :question_likes, source: :question
  has_many :answer_liked_answers, through: :answer_likes, source: :answer
end
