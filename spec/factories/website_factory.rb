FactoryGirl.define do
  factory :website do
    sequence :url do |n|
      "http://example.com/#{n}"
    end

    factory :website_enqueued do
      after(:create) do |website,_|
        website.pollable_meta_data.enqueue!
      end
    end
  end
end