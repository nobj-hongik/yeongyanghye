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
    영양: 3
  }

  CATEGORY = {'제품': 0, '한방': 1, '운동': 2, '영양': 3}.freeze

  def self.create_dummy
    self::CATEGORY.each do |key,value|
      (0..3).each do |n|
        Magazine.create!(title: key.to_s + ' -> ' + n.to_s + ' 번쨰 글', content: 'content', category: value, is_selected: true, sequence: n ,user_id: User.second) if Rails.env.development?
      end
    end
  end
end
