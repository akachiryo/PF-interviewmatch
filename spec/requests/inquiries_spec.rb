require 'rails_helper'

RSpec.describe "Inquiries", type: :request do
  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get inquiry_index_url
      expect(response.status).to eq 200
    end
    # it '通知一覧が表示されていること' do
    #   before do
    #     @takashi = FactoryBot.create(:takashi)
    #     @satoshi = FactoryBot.create(:satoshi)
    #     @notification = FactoryBot.create(visitor_id: @takashi.id, visited_id: @satoshi.id, active: "follow")
    #   end
    #   # let(:notification) { FactoryBot.create :notification }
    #   get inquiry_index_url
    #   expect(response.body).to incloud "さんがあなたをフォローしました"
    # end

    it '画面が表示されていること' do
      get inquiry_index_url
      expect(response.body).to include "お問い合わせ"
    end
  end
end
