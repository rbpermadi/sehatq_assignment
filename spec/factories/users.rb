FactoryBot.define do
  factory :user, class: 'user' do
    email { 'rojali.budi.permadi@gmail.com' }
    name { 'rojali budi permadi' }
    encrypted_password  { 'xxxxxxxxxxxxxxxxxxxxxxxxxxx' }
    image_url  { '/uploads/hcf/image/18/image_path.png' }
    reset_password_token { }
    reset_password_sent_at { }
    remember_created_at { }
    provider { '' }
    uid { '' }
  end
end
