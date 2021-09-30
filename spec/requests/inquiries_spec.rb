require 'rails_helper'

RSpec.describe 'Inquiries', type: :request do
  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get inquiry_index_url
      expect(response.status).to eq 200
    end
    it '画面が表示されていること' do
      get inquiry_index_url
      expect(response.body).to include 'お問い合わせ'
    end
  end
end
