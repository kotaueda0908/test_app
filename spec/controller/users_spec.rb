require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET #index" do
    let(:user) { FactoryBot.create(:user) }
    before do
        sign_in user
    end

    it "can get it" do
      get :index

      p response
    end
  end
end