class Magazine < ActiveRecord::Base
    belongs_to :user
    has_many :magazinelikes
    has_many :magazine_comments
    has_many :l_users, through: :magazinelikes, source: :user
    mount_uploader :image, MagazineImageUploader
end
