FactoryBot.define do
  factory :notification do
    action { "" }
  end
  factory :notification_follow do
    visiter_id { 1 }
    visited_id { 2 }
    action { "follow" }
  end
end