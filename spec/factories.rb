FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.fake" }
    password '111111'
  end  

  factory :message_board do
    user
    sequence(:name) { |n| "message_board#{n}" }
  end

  factory :message do
    content 'This is some random content.'
  end
end