class Question < ApplicationRecord
  belongs_to :user
  has_many :question_comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :question_likes, dependent: :destroy
  has_many :question_liked_users, through: :question_likes, source: :user, dependent: :destroy

  enum category: {
    건강관리: 0,
    미용: 1,
    다이어트: 2,
    한방관리: 3,
    제철관리: 4,
    영양기타: 5,
    운동: 6
  }

  CATEGORY = { '건강관리': 0, '미용': 1, '다이어트': 2, '한방관리': 3, '제철관리': 4, '영양기타': 5, '운동': 6 }.freeze

  def owner_selected?
    return true if self.owner_selected == true
  end

  def answer_already_selected
    return true if self.answers.pluck(:is_selected).include?(true)
  end
end
