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

  category = Category.create(name: 'Japan')
  category.image.attach(io: File.open(Rails.root.join('db/images/Japan.jpg')), filename: 'Japan.jpg')
  category = Category.create(name: 'America')
  category.image.attach(io: File.open(Rails.root.join('db/images/America.jpg')), filename: 'America.jpg')
  category = Category.create(name: 'Britain')
  category.image.attach(io: File.open(Rails.root.join('db/images/Britain.jpg')), filename: 'Britain.jpg')
  category = Category.create(name: 'France')
  category.image.attach(io: File.open(Rails.root.join('db/images/France.jpg')), filename: 'France.jpg')
  category = Category.create(name: 'Italy')
  category.image.attach(io: File.open(Rails.root.join('db/images/Italy.jpg')), filename: 'Italy.jpg')
  category = Category.create(name: 'Spain')
  category.image.attach(io: File.open(Rails.root.join('db/images/Spain.jpg')), filename: 'Spain.jpg')
  category = Category.create(name: 'Germany')
  category.image.attach(io: File.open(Rails.root.join('db/images/Germany.jpg')), filename: 'Germany.jpg')
  category = Category.create(name: 'Portugal')
  category.image.attach(io: File.open(Rails.root.join('db/images/Portugal.jpg')), filename: 'Portugal.jpg')
  category = Category.create(name: 'Netherlands')
  category.image.attach(io: File.open(Rails.root.join('db/images/Netherlands.jpg')), filename: 'Netherlands.jpg')
  category = Category.create(name: 'Belgium')
  category.image.attach(io: File.open(Rails.root.join('db/images/Kingdom_of_Belgium.jpg')), filename: 'Kingdom_of_Belgium.jpg')
  category = Category.create(name: 'Russian')
  category.image.attach(io: File.open(Rails.root.join('db/images/Russian.jpg')), filename: 'Russian.jpg')
  category = Category.create(name: 'Egypt')
  category.image.attach(io: File.open(Rails.root.join('db/images/Egypt.jpg')), filename: 'Egypt.jpg')
  category = Category.create(name: 'China')
  category.image.attach(io: File.open(Rails.root.join('db/images/China.jpg')), filename: 'China.jpg')
  category = Category.create(name: 'Korea')
  category.image.attach(io: File.open(Rails.root.join('db/images/Korea.jpg')), filename: 'Korea.jpg')
  category = Category.create(name: 'Taiwan')
  category.image.attach(io: File.open(Rails.root.join('db/images/Taiwan.jpg')), filename: 'Taiwan.jpg')
  category = Category.create(name: 'Vietnam')
  category.image.attach(io: File.open(Rails.root.join('db/images/Vietnam.jpg')), filename: 'Vietnam.jpg')
  category = Category.create(name: 'Thailamd')
  category.image.attach(io: File.open(Rails.root.join('db/images/Thailamd.jpg')), filename: 'Thailamd.jpg')
  category = Category.create(name: 'Singapore')
  category.image.attach(io: File.open(Rails.root.join('db/images/Singapore.jpg')), filename: 'Singapore.jpg')
  category = Category.create(name: 'Malaysia')
  category.image.attach(io: File.open(Rails.root.join('db/images/Malaysia.jpg')), filename: 'Malaysia.jpg')
  category = Category.create(name: 'Indonesia')
  category.image.attach(io: File.open(Rails.root.join('db/images/Indonesia.jpg')), filename: 'Indonesia.jpg')
  category = Category.create(name: 'Philippines')
  category.image.attach(io: File.open(Rails.root.join('db/images/Philippines.jpg')), filename: 'Philippines.jpg')
  category = Category.create(name: 'India')
  category.image.attach(io: File.open(Rails.root.join('db/images/India.jpg')), filename: 'India.jpg')
  category = Category.create(name: 'Australia')
  category.image.attach(io: File.open(Rails.root.join('db/images/Australia.jpg')), filename: 'Australia.jpg')
  category = Category.create(name: 'New Zealand')
  category.image.attach(io: File.open(Rails.root.join('db/images/New_Zealand.jpg')), filename: 'New_Zealand.jpg')
  category = Category.create(name: 'Canada')
  category.image.attach(io: File.open(Rails.root.join('db/images/Canada.jpg')), filename: 'Canada.jpg')
  category = Category.create(name: 'Mexico')
  category.image.attach(io: File.open(Rails.root.join('db/images/Mexico.jpg')), filename: 'Mexico.jpg')
  category = Category.create(name: 'Brasil')
  category.image.attach(io: File.open(Rails.root.join('db/images/Brasil.jpg')), filename: 'Brasil.jpg')
  category = Category.create(name: 'Argentina')
  category.image.attach(io: File.open(Rails.root.join('db/images/Argentina.jpg')), filename: 'Argentina.jpg')
  category = Category.create(name: 'Peru')
  category.image.attach(io: File.open(Rails.root.join('db/images/Peru.jpg')), filename: 'Peru.jpg')