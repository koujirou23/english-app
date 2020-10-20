FactoryBot.define do
  factory :posts_tag do
    title     { 'title' }
    text      { 'text' }
    name      { 'tag' }
    user_id   { 1 }
    # after(:build) do |post|
    #   post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end
