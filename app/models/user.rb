class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:facebook,:kakao]
         #:confirmable 이메일 인증
  has_many :nutritions
  has_many :magazines
  has_many :magazine_comments
  has_many :magazinelikes
  has_many :l_magazines, through: :magazinelikes, source: :magazine
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
  acts_as_followable #팔로우 받을때
  acts_as_follower #팔로우할때

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

  def currentuserevents
    @currentuserevents = Event.find(:all, :conditions => { :user_id => 'current_user.id' , :eventime => 'Date.today' })

  end

  def is_created? #지금 이걸로 중복된거 생성안되게 미리 확인하고 생성되게
      if @currentuserevents.size >= 1
        return false
      else
        return true
      end
  end

  def event_usertoday_if_exists
    record = Event.select(:eventime).find_by(Date.today)
    if record
      if record.user_id == current_user.id
        true
      else
        false
      end
    else
      nil # explicit nil so other developers know exactly what's going on
    end
  end



  def self.find_for_oauth(auth, signed_in_resource = nil)

      # user와 identity가 nil이 아니라면 받는다
      identity = Identity.find_for_oauth(auth)
      user = signed_in_resource ? signed_in_resource : identity.user

      # user가 nil이라면 새로 만든다.
      if user.nil?

        # 이미 있는 이메일인지 확인한다.
        email = auth.info.email
        user = User.where(:email => email).first
        unless self.where(email: auth.info.email).exists?

          # 없다면 새로운 데이터를 생성한다.
          if user.nil? && auth.provider=="kakao"
            user = User.new(
              profile_img:  auth.info.image,
              image: auth.extra.properties.profile_image,
              name: auth.info.name,
              email: auth.info.email || "#{auth.uid}@yeongyanghye.com",
              password: Devise.friendly_token[0,20]
            )
            user.save!
          end

          if user.nil? && auth.provider=="facebook"
            user = User.new(
              profile_image:  auth.info.image,
              image:  auth.info.image,
              name: auth.info.name,
              email: auth.info.email || "#{auth.uid}@yeongyanghye.com",
              password: Devise.friendly_token[0,20]
            )
            user.save!
          end

        end

      end

      if identity.user != user
        identity.user = user
        identity.save!
      end
      user

    end

  # email이 없어도 가입이 되도록 설정

  def email_required?
    false
  end



end
