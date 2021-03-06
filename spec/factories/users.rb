FactoryBot.define do
    factory :user do
        name { 'TestUser'}
        email { 'Test@example.com' }
        password { 'password' }
        password_confirmation { "password" }
        confirmed_at { Date.today }
    end
end