# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

type_name = [
	"トップウォーター",
	"バズベイト",
	"ミノー",
	"シャッド",
	"クランクベイト",
	"バイブレーション",
	"スピナーベイト",
	"ビックベイト",
	"メタル系",
	"ラバージグ・スモラバ",
	"ワーム（ソフトルアー）"
]
type_name.each do |type|
  LureType.find_or_create_by(type_name: type)
end

maker_name = [
	"ダイワ",
	"シマノ",
	"ゲーリーヤマモト",
	"O.S.P",
	"ジャッカル",
	"エバーグリーン",
	"ノリーズ",
	"ケイテック"
]
maker_name.each do |mk|
  Maker.find_or_create_by(maker_name: mk)
end

# 別の書き方
# lure_types = %w(
# 	トップウォーター
# 	バズベイト
# 	ミノー
# 	シャッド
# 	クランクベイト
# 	バイブレーション
# 	スピナーベイト
# 	ビックベイト
# 	メタル系
# 	ラバージグ・スモラバ
# 	ソフトルアー
# )
# lure_types.each do |lure_type|
#   LureType.find_or_create_by(type_name: lure_type)
# end

# makers = %w(
# 	ダイワ
# 	シマノ
# 	ゲーリーヤマモト
# 	O.S.P
# 	ジャッカル
# 	エバーグリーン
# 	ノリーズ
# 	ケイテック
# )
# makers.each do |maker|
#   Maker.find_or_create_by(maker_name: maker)
# end

