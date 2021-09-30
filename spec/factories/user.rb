FactoryBot.define do
  factory :user do
    name { 'testuser1' }
    email { 'a@a' }
    password { 'aaaaaa' }

    trait :invalid do
      name { 'nil' }
    end

    trait :is_deleted do
      active { true }
    end
  end

  factory :takashi, class: User do
    name  { 'Takashi' }
    email { 'takashi@example.com' }
    password { 'aaaaaa' }
    password_confirmation { 'aaaaaa' }
    # after(:create) do |user|
    #   user.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    # end
  end

  factory :satoshi, class: User do
    name { 'Satoshi' }
    email { 'satoshi@example.com' }
    password { 'aaaaaa' }
  end
end
