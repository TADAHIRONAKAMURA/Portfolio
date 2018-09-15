class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	validates :registration_check, acceptance: true, on: :create

	has_many :fishing_reports,	dependent: :destroy
	has_many :favorites,	dependent: :destroy
	has_many :report_comment, dependent: :destroy
	has_many :complaint,	dependent: :destroy
	has_many :tackle_reports
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :followers, through: :reverse_relationships, source: :follower

  attachment :user_image
 
	def following?(other_user)
 		followed_users.include?(other_user)
	end

	def follow!(other_user)
  	relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
  	relationships.find_by(followed_id: other_user.id).destroy
	end

	end
  	