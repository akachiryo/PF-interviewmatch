FactoryBot.define do
  factory :room do
    user_id { 1 }
    time_tag_id { 1 }
    ocuupation_tag_id { 1 }
    title { 'a' }
    content { 'a' }
  end
end