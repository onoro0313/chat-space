FactoryGirl.define do
  factory :message do

    body              { Faker::Lorem.sentence }
    image             { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/test.jpg')) }
    user_id           "1"
    group_id          "1"
end
end
