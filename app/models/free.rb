class Free < ApplicationRecord
  belongs_to :user
  has_many :free_comments, dependent: :destroy
  has_many :freelikes, dependent: :destroy
  has_many :freeliked_users, through: :freelikes, source: :user, dependent: :destroy
end
