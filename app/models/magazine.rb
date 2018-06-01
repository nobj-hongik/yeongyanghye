class Magazine < ActiveRecord::Base
    belongs_to :user
    mount_uploader :image, MagazineImageUploader
end
