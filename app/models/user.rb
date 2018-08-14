class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :nutritions
  has_many :magazines
  has_many :magazine_comments
  has_many :magazinelikes
  has_many :l_magazines, through: :magazinelikes, source: :user
  has_many :questions
  has_many :question_comments
  has_many :answers
  has_many :answer_comments
  has_many :question_liked_questions, through: :question_likes, source: :question
  has_many :answer_liked_answers, through: :answer_likes, source: :answer
  has_many :frees
  has_many :freelikes
  has_many :liked_frees, through: :freelikes, source: :free

  # 좋아하는지 아닌지 판별하는 인스턴스 매소드 (현성형 매거진 좋아요도 추가가능)
  def is_like?(object)
    if object.to_s = "Question"
      QuestionLike.find_by(user_id: self.id, question_id: question.id).present?
    elsif object.to_s = "Answer"
      AnswerLike.find_by(user_id: self.id, answer_id: answer.id).present?
    else
      return false
    end
  end
  
end
