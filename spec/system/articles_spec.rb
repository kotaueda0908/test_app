require 'rails_helper'

describe '記事管理機能', type: :system do
    describe '一覧表示機能' do
        before do
            # ユーザーAを作成しておく
            user_a = FactoryBot.create(:user, name: 'ユーザーA')
            # 作成者がユーザーAであるタスクを作成しておく
            user_a.skip_confirmation!
            user_a.save!
            FactoryBot.create(:article, title: '最初のタスク', user: user_a)
        end

        context 'ユーザーAがログインしているとき' do
            before do
                # ユーザーAでログインする
                visit new_user_session_path
                fill_in "user_email", with: "Test@example.com"
                fill_in 'user_password', with: 'password'
                click_button 'Log in'
            end

            it 'ユーザーAが作成したタスクが表示される' do
                # 作成済みのタスクの名称が画面上に表示されていることを確認
                expect(page).to have_content '最初のタスク'
            end
        end
    end
end