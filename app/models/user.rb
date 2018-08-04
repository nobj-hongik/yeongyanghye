class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :nutritions  
  has_many :magazines
  has_many :magazinelikes
  has_many :l_magazines, through: :magazinelikes, source: :user
end
