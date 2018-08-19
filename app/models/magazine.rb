class Magazine < ActiveRecord::Base
  belongs_to :user
  has_many :magazinelikes, dependent: :destroy
  has_many :magazine_comments, dependent: :destroy
  has_many :l_users, through: :magazinelikes, source: :user, dependent: :destroy
  mount_uploader :image, MagazineImageUploader

  enum category: {
    제품: 0,
    한방: 1,
    운동: 2,
    영양: 3,
  }

  CATEGORY = {'제품': 0, '한방': 1, '운동/헬스': 2, '영양': 3}.freeze

end
