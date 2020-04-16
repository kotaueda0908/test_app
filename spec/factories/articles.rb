FactoryBot.define do
    factory :article do
        title { 'テストを書く' }
        content { 'Rspec & Capybara & FactoryBot を準備する'}
        # :userという名前のFactoryをTaskモデルに定義されたuserという名前の関連を生成するのに利用する
        user
    end
end