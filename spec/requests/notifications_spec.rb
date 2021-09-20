require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  describe "GET #index" do
    context "パラメータが妥当な時" do
      let(:user) { FactoryBot.create :user }
      before do
        sign_in user
      end
      it "リクエストが成功したとき" do
        get users_notifications_url
        expect(response.status).to eq 200
      end
      it "通知が表示されているとき" do
        takashi = FactoryBot.create(:takashi)
        FactoryBot.create(:notification, visiter_id: takashi.id, visited_id: user.id, action: "follow")
        get users_notifications_url
        expect(response.body).to include "あなたをフォローしました"
      end
    end
    context "パラメータが不当な時" do
      let(:user) { FactoryBot.create :user }
      before do
        sign_in user
      end
      it "通知が表示されていないとき(notificationなし）" do
        get users_notifications_url
        expect(response.body).not_to include "あなたをフォローしました"
      end
    end
  end
end
