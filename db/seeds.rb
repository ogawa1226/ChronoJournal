# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  user = User.find_or_create_by(name: "テスト", email: "test@test.com") do |u|
    u.password = "123456"
  end
  puts "ユーザーを作成"
end

categories = [
  "外出",
  "記念日",
  "仕事",
  "病院",
  "美容",
  "趣味",
  "旅行",
  "その他"
]

categories.each do |category|
  Category.find_or_create_by(name: category)
  puts "カテゴリー『#{category}』を作成"
end


if Rails.env.development?
  3.times do |n|
    start_start_day = DateTime.new(2023,12, 1, 10, 20, 30)
    start_end_day = DateTime.new(2023, 12, 1, 11, 30, 40)
    end_start_day = DateTime.new(2023,12, 1, 12, 20, 30)
    end_end_day = DateTime.new(2023, 12, 1, 13, 30, 40)
    schedule = Schedule.create!(
      day: Date.new(2023, 12, 1),
      user_id: user.id,
      category_id: 1,
      title: "タイトル#{n + 1}",
      start_time: Random.rand(start_start_day..start_end_day),
      end_time: Random.rand(end_start_day..end_end_day)
    )
    puts "スケジュール#{n + 1}を作成"
    Reflection.create!(
      user_id: user.id,
      schedule_id: schedule.id,
      title: "振り返りタイトル",
      content: "内容"
    )
  
  end
  puts "スケジュール全作成"
end
