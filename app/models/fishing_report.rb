class FishingReport < ApplicationRecord

	belongs_to :user	
	has_many :favorites,	dependent: :destroy
	# has_many :favorites
	has_many	:report_comments,	dependent: :destroy
	has_many	:complaints,	dependent: :destroy
	belongs_to	:lure_type	
	belongs_to	:fishing_spot	
  	attachment :a_image
  	attachment :b_image
  	attachment :c_image
  	attachment :d_image
  	attachment :e_image

  	validates :fishing_body, length: { maximum:300 }
  	validates :lure_name, length: { maximum:25 }



		

	# 絞り込み検索時に使用するデータ（seedに入っているIDと内容を同じにすると使えるっぽい）
	enum time: { "１時": 1, "２時": 2, "３時": 3, "４時": 4, "５時": 5, "６時": 6, "７時": 7, "８時": 8, "９時": 9, "１０時": 10, "１１時": 11, "１２時": 12, "１３時": 13, "１４時": 14, "１５時": 15, "１６時": 16, "１７時": 17, "１８時": 18, "１９時": 19, "２０時": 20, "２１時": 21, "２２時": 22, "２３時": 23, "２４時": 24, "非公開": 25 }
	enum weather: { 快晴: 1, 晴れ: 2, 曇り: 3, 小雨: 4, 大雨: 5 } 
	# enum size: { "小バス": 1, "20cm以上": 2, "30cm以上": 3, "40cm以上": 4, "50cm以上": 5, "60cm以上": 6, "70cm以上": 7 } 
	enum range: { "ボトム(低)": 1, 中層: 2, 表層: 3 } 
	enum retrieve: { 早い: 1, 普通: 2, ゆっくり: 3, とてもゆっくり: 4, 放置: 5, その他: 6 } 

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	
end