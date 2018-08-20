class Nutrition < ActiveRecord::Base
    belongs_to :user
    acts_as_followable #팔로우 받을때
end
