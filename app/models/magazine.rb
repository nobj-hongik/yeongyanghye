class Magazine < ActiveRecord::Base
    belongs_to :user
    has_many :magazinelikes, dependent: :destroy
    has_many :magazine_comments, dependent: :destroy
    has_many :l_users, through: :magazinelikes, source: :user, dependent: :destroy
    mount_uploader :image, MagazineImageUploader
end
