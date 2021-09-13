# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  5.times do |n|
    @user = User.create!(
      email: "test#{n + 1}@test.com",
      name: "太郎#{n + 1}",
      password: "password",
      sex: 1,
      birth_at: '1999-01-20'
    )
  end

  Category.create!(
  [
    {
      name: '日本',
    },
    {
      name: 'アメリカ',
    },
    {
      name: 'イギリス',
    },
    {
      name: 'フランス',
    },
    {
      name: 'イタリア',
    },
    {
      name: 'スペイン',
    },
    {
      name: 'ドイツ',
    },
    {
      name: 'ポルトガル',
    },
    {
      name: 'オランダ',
    },
    {
      name: 'ベルギー',
    },
    {
      name: 'スイス',
    },
    {
      name: 'ギリシャ',
    },
    {
      name: 'トルコ',
    },
    {
      name: 'オーストリア',
    },
    {
      name: 'チェコ',
    },
    {
      name: 'ハンガリー',
    },
    {
      name: 'ポーランド',
    },
    {
      name: 'フィンランド',
    },
    {
      name: 'スウェーデン',
    },
    {
      name: 'ノルウェー',
    },
    {
      name: 'デンマーク',
    },
    {
      name: 'アイスランド',
    },
    {
      name: 'クロアチア',
    },
    {
      name: 'スロベニア',
    },
    {
      name: 'ロシア',
    },
    {
      name: 'エジプト',
    },
    {
      name: '中国',
    },
    {
      name: '韓国',
    },
    {
      name: '台湾',
    },
    {
      name: 'ベトナム',
    },
    {
      name: 'タイ',
    },
    {
      name: 'シンガポール',
    },
    {
      name: 'マレーシア',
    },
    {
      name: 'インドネシア',
    },
    {
      name: 'フィリピン',
    },
    {
      name: 'インド',
    },
    {
      name: 'ミャンマー',
    },
    {
      name: 'カンボジア',
    },
    {
      name: 'オーストラリア',
    },
    {
      name: 'ニュージーランド',
    },
    {
      name: 'カナダ',
    },
    {
      name: 'メキシコ',
    },
    {
      name: 'ブラジル',
    },
    {
      name: 'アルゼンチン',
    },
    {
      name: 'ペルー',
    }
  ]
)