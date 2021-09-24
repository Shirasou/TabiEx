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
      name: 'Japan',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Japan.jpg")))
    },
    {
      name: 'America',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/America.jpg")))
    },
    {
      name: 'Britain',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/UK.jpg")))
    },
    {
      name: 'France',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/France.jpg")))
    },
    {
      name: 'Italy',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Italy.jpg")))
    },
    {
      name: 'Spain',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Spain.jpg")))
    },
    {
      name: 'Germany',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Germany.jpg")))
    },
    {
      name: 'Portugal',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Portugal.jpg")))
    },
    {
      name: 'Netherlands',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Netherlands.jpg")))
    },
    {
      name: 'Kingdom of Belgium',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Kingdom_of_Belgium.jpg")))
    },
    {
      name: 'Russian',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Russian.jpg")))
    },
    {
      name: 'Egypt',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Egypt.jpg")))
    },
    {
      name: 'China',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/China.jpg")))
    },
    {
      name: 'Korea',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Korea.jpg")))
    },
    {
      name: 'Taiwan',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Taiwan.jpg")))
    },
    {
      name: 'Vietnam',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Vietnam.jpg")))
    },
    {
      name: 'Thailamd',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Thailamd.jpg")))
    },
    {
      name: 'Singapore',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Singapore.jpg")))
    },
    {
      name: 'Malaysia',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Malaysia.jpg")))
    },
    {
      name: 'Indonesia',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Indonesia.jpg")))
    },
    {
      name: 'Philippines',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Philippines.jpg")))
    },
    {
      name: 'india',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/india.jpg")))
    },
    {
      name: 'Australia',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Australia.jpg")))
    },
    {
      name: 'New Zealand',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/New_Zealand.jpg")))
    },
    {
      name: 'Canada',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Canada.jpg")))
    },
    {
      name: 'Mexico',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Mexico.jpg")))
    },
    {
      name: 'Brasil',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Brasil.jpg")))
    },
    {
      name: 'Argentina',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Argentina.jpg")))
    },
    {
      name: 'Peru',
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Peru.jpg")))
    }
  ]
)