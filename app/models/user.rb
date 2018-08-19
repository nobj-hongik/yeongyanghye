class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable
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
  has_many :free_comments
  has_many :liked_frees, through: :freelikes, source: :free
  has_many :events

  # 좋아하는지 아닌지 판별하는 인스턴스 매소드 (현성형 매거진 좋아요도 추가가능)
  def is_like?(object)
    if object.class.name == "Question"
      return QuestionLike.find_by(user_id: self.id, question_id: object.id).present? ? true : false
    elsif object.class.name == "Answer"
      return AnswerLike.find_by(user_id: self.id, answer_id: object.id).present? ? true : false
    else
      return false
    end
  end
  
  def is_created?(object) #지금 이걸로 중복된거 생성안되게 미리 확인하고 생성되게 
      if object.user_id == current_user.id && object.eventime = Date.today
        return false 
      else 
        return true 
      end
  end
end
