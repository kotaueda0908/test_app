require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Userバリデーションチェック' do
    it 'nameが空欄の場合、User作成不可' do
      @user = FactoryBot.build(:user, name: '')
      expect(@user.valid?).to eq(false)
    end

    it 'emailが重複していても、User作成可' do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.build(:user, email: 'Test@example.com')
      expect(@user.valid?).to eq(true)
    end
  end
end