class QuestionLike < ApplicationRecord
  belongs_to :question, counter_cache: true
  belongs_to :user
  belongs_to :question
end
