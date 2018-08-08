class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :answer_comments, dependent: :destroy
  has_many :answer_likes, dependent: :destroy
  has_many :answer_liked_users, through: :answer_likes, source: :user, dependent: :destroy

  def is_selected?
    return true if self.is_selected == true
  end

  def toggle_answer
    if self.is_selected == true
      self.update(is_selected: false)
      self.question.update(owner_selected: false)
    else
      self.update(is_selected: true)
      self.question.update(owner_selected: true)
    end
  end
end
